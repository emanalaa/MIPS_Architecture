import re


class MipsAssembler:
    def __init__(self):
        self.reg_map = {}
        self.map_instructions = {}
        self.mapped_labels = {}
        self.data_machine_code_list = []
        self.code = []
        self.machine_code = []

    def read_file(self):
        temp_line = []
        with open("Mips_code.txt") as file:
            for line in file:
                if line[0] == "#":
                    continue
                for x in line:
                    if x == '#':
                        break
                    else:
                        temp_line += x
                line = "".join(temp_line)
                line = line.strip()
                self.code.append(line)
                temp_line.clear()

    def write_file(self):
        with open("machine_code.txt", "w+") as f:
            f.write("#Translation of Data Segment"+"\n")
            d = 0
            for item in self.data_machine_code:
                f.write("MEMORY(" + d + ") <=" + item + "\n")
                d += 1
            i = 0
            f.write("#Translation of Code Segment" + "\n")
            for item in self.machine_code:
                f.write("MEMORY(" + i + ") <=" + item + "\n")
                i += 1
        print("Done! Your output is in text file machine_code.txt!")

    def labels_mapping(self):
        data_counter = 0
        code_counter = 0
        text = False
        for line in self.code:
            new_line = re.findall(r"[\w']+", line)
            if not text and new_line[0] == 'data':
                continue
            if len(new_line) == 0:
                continue
            if new_line[0] == '#':
                continue
            if new_line[0] == 'text':
                text = True
                continue
            if not text:
                if len(new_line) > 1:
                    if new_line[1] == 'word':
                        data_counter += len(new_line)-2
                    else:
                        data_counter += int(new_line[2])*4
            else:
                if new_line[0] in self.map_instructions:
                    code_counter += 4
                else:
                    self.mapped_labels[new_line[0]] = code_counter
                    code_counter += 4

    def registers_mapping(self):
        self.reg_map = {
          "$zero": "00000",
          "$at": "00001",
          "$v0": "00010",
          "$v1": "00011",
          "$a0": "00100",
          "$a1": "00101",
          "$a2": "00110",
          "$a3": "00111",
          "$t0": "01000",
          "$t1": "01001",
          "$t2": "01010",
          "$t3": "01011",
          "$t4": "01100",
          "$t5": "01101",
          "$t6": "01110",
          "$t7": "01111",
          "$t8": "11000",
          "$t9": "11001",
          "$s0": "10000",
          "$s1": "10001",
          "$s2": "10010",
          "$s3": "10011",
          "$s4": "10100",
          "$s5": "10101",
          "$s6": "10110",
          "$s7": "10111",
          "$k0": "11010",
          "$k1": "11011",
          "$gp": "11100",
          "$sp": "11101",
          "fp": "11110",
          "$ra": "11111"
        }

    def instructions_mapping(self):
        self.map_instructions = {
         "add": ["000000", "100000", "R"],
         "and": ["000000", "10100", "R"],
         "sub": ["000000", "100010", "R"],
         "nor": ["000000", "100111", "R"],
         "or": ["000000", "100101", "R"],
         "slt": ["000000", "101010", "R"],
         "addi": ["001000", "none", "I"],
         "lw": ["100011", "none", "I"],
         "sw": ["101011", "none", "I"],
         "beq": ["000100", "none", "I"],
         "bne": ["000101", "none", "I"],
         "j": ["000010", "none", "J"]}

    def assembler(self):
        for lines in self.code:
            line = re.findall(r"[\w']+", lines)
            test = self.map_instructions[line[0]]
            m_code = test[0]
            if test[2] == "I":
                if line[0] == "lw" or line[0] == "sw":
                    m_code += self.reg_map[line[3]]
                    m_code += self.reg_map[line[1]]
                    m_code += line[2]
                else:
                    m_code += self.reg_map[line[1]]
                    m_code += self.reg_map[line[2]]
                    temp = self.mapped_labels.get(line[3])
                    if temp is None:
                        m_code += line[3]
                    else:
                        m_code += temp
            elif test[2] == "J":
                temp = self.mapped_labels.get(line[1])
                if temp is None:
                    m_code += temp
                else:
                    m_code += line[1]
            elif test[2] == "R":
                m_code += self.reg_map[line[2]]
                m_code += self.reg_map[line[3]]
                m_code += self.reg_map[line[1]]
                m_code += "00000"
                m_code += test[1]

            self.machine_code = self.machine_code + "\n" + m_code

    def data_machine_code(self):
        for line in self.code:
            new_line = re.findall(r"[\w']+", line)
            if len(new_line) == 0:
                continue
            if new_line[0] == "text":
                break
            length_of_line = len(new_line)
            length_of_line -= 2
            i = 0
            index = 2

            if len(new_line) < 2:
                continue

            if new_line[1] == "space" or new_line[1] == "Space":
                while i < length_of_line:
                    j = 0
                    while j < int(new_line[index]) and index < len(new_line):
                        data_code = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
                        self.data_machine_code_list.append(data_code)
                        j += 1
                    index += 1
                    i += 1
            elif new_line[1] == "word" or new_line[1] == "Word":
                while i < length_of_line:
                    binary = bin(int(new_line[index]))
                    data_code = binary.zfill(32) #for adding zeroes at the beginning of the string
                    self.data_machine_code_list.append(data_code)
                    index += 1
                    i += 1


mips_assembler = MipsAssembler()
print("Welcome to our mips assembler.\nloading...")
mips_assembler.read_file()
mips_assembler.registers_mapping()
mips_assembler.instructions_mapping()
mips_assembler.labels_mapping()
for label in mips_assembler.mapped_labels:
    print(label, mips_assembler.mapped_labels[label])
mips_assembler.data_machine_code()
mips_assembler.assembler()
mips_assembler.write_file()

