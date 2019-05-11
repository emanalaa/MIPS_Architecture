import re


class MipsAssembler:
    def __init__(self):
        self.reg_map = {}
        self.map_instructions = {}
        self.mapped_labels = {}
        self.data_labels_map = {}
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
        return self.code

    def write_file(self):
        with open("machine_code.txt", "w+") as f:
            f.write("#Translation of Data Segment"+"\n")
            d = 0
            for item in self.data_machine_code_list:
                f.write("MEMORY(" + str(d) + ") <=" + str(item) + "\n")
                d += 1
            i = 0
            f.write("#Translation of Code Segment" + "\n")
            for item in self.machine_code:
                f.write("MEMORY(" + str(i) + ") <=" + str(item) + "\n")
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
                        self.data_labels_map[new_line[0]] = data_counter
                        data_counter += 4
                    else:
                        self.data_labels_map[new_line[0]] = data_counter
                        data_counter += int(new_line[2])*4
            else:
                if new_line[0] in self.map_instructions:
                    code_counter += 4
                else:
                    self.mapped_labels[new_line[0]] = code_counter
                    code_counter += 4

    def registers_mapping(self):
        self.reg_map = {
          "zero": "00000",
          "at": "00001",
          "v0": "00010",
          "v1": "00011",
          "a0": "00100",
          "a1": "00101",
          "a2": "00110",
          "a3": "00111",
          "t0": "01000",
          "t1": "01001",
          "t2": "01010",
          "t3": "01011",
          "t4": "01100",
          "t5": "01101",
          "t6": "01110",
          "t7": "01111",
          "t8": "11000",
          "t9": "11001",
          "s0": "10000",
          "s1": "10001",
          "s2": "10010",
          "s3": "10011",
          "s4": "10100",
          "s5": "10101",
          "s6": "10110",
          "s7": "10111",
          "k0": "11010",
          "k1": "11011",
          "gp": "11100",
          "sp": "11101",
          "fp": "11110",
          "ra": "11111"
        }

    def instructions_mapping(self):
        self.map_instructions = {
         "add": ["000000", "100000", "R"],
         "and": ["000000", "100100", "R"],
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
            m_code=0
            line = re.findall(r"[\w']+", lines)

            if not line:
                continue
            elif line[0] == "data":
                continue
            elif line[0] == "text":
                continue
            elif line[0] in self.map_instructions.keys():
                test = self.map_instructions[line[0]]
                m_code = test[0]
                if test[2] == "I":
                    if line[0] == "lw" or line[0] == "sw":
                        m_code += self.reg_map[line[3]]
                        m_code += self.reg_map[line[1]]
                        if line[2].isdigit():
                            my_binary = bin(int(line[2]))[2:]
                            bin_no = my_binary.zfill(16)
                            m_code += bin_no
                        else:
                            c = bin(int(self.data_labels_map[line[2]]))[2:]
                            new_c = c.zfill(16)
                            m_code += new_c

                    else:
                        m_code += self.reg_map[line[1]]
                        m_code += self.reg_map[line[2]]
                        temp = self.mapped_labels[line[3]]
                        bin_no=bin(int(temp))[2:]
                        bin_no = my_binary.zfill(16)
                        m_code += bin_no
                        #if temp is None:
                         #   m_code += line[3]
                        #else:
                          #  m_code += str(temp)
                elif test[2] == "J":
                    temp = self.mapped_labels.get(line[1])

                    if temp is None:
                        m_code += str(temp)
                    else:
                        m_code += line[1]

                elif test[2] == "R":
                    m_code += self.reg_map[line[2]]
                    m_code += self.reg_map[line[3]]
                    m_code += self.reg_map[line[1]]
                    m_code += "00000"
                    m_code += test[1]
                self.machine_code.append(m_code)

            elif line[1] in self.map_instructions: #if line[0]=label
                test = self.map_instructions[line[1]]
                m_code = test[0]
                if test[2] == "I":
                    if line[1] == "lw" or line[1] == "sw":
                        m_code += self.reg_map[line[4]]
                        m_code += self.reg_map[line[2]]
                        if line[3].isdigit():
                            my_binary = bin(int(line[3]))[2:]
                            bin_no = my_binary.zfill(16)
                            m_code += bin_no
                        else:
                            c = bin(int(self.data_labels_map[line[3]]))[2:]
                            new_c = c.zfill(16)
                            m_code += new_c

                    else:
                        m_code += self.reg_map[line[2]]
                        m_code += self.reg_map[line[3]]
                        temp = self.mapped_labels.get(line[4])
                        if temp is None:
                            m_code += line[4]
                        else:
                            m_code += str(temp)
                elif test[2] == "J":
                    temp = self.mapped_labels.get(line[2])
                    bin_no = bin(int(temp))[2:]
                    bin_no = my_binary.zfill(16)
                    m_code += bin_no
                    '''if temp is None:
                        m_code += str(temp)
                    else:
                        m_code += line[2]'''

                elif test[2] == "R":
                    m_code += self.reg_map[line[3]]
                    m_code += self.reg_map[line[4]]
                    m_code += self.reg_map[line[2]]
                    m_code += "00000"
                    m_code += test[1]
                self.machine_code.append(m_code)

            #else:
                #continue

        return self.machine_code

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
                    binary = bin(int(new_line[index]))[2:]
                    data_code = binary.zfill(32) #for adding zeroes at the beginning of the string
                    self.data_machine_code_list.append(data_code)
                    index += 1
                    i += 1
        return self.data_machine_code_list

#'''
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
#print(mips_assembler.mapped_labels)
#'''
#mips_assembler = MipsAssembler()
#mips_assembler.read_file()
#leno=len(mips_assembler.data_machine_code_list)
#print(leno)