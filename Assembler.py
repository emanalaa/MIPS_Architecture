def to_binary():
    pass


class MipsAssembler:
    def __init__(self):
        self.map_instructions = dict()

    def read_file(self):
        pass

    def write_file(self):
        pass

    def labels_mapping(self):
        pass

    def registers_mapping(self):
        pass

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
        pass


