AS = as
LD = ld

ASFLAGS = -o $@

SRC_DIR = src
OBJ_DIR = object
BIN_DIR = bin

SRC = $(wildcard $(SRC_DIR)/*.s)
OBJ = $(patsubst $(SRC_DIR)/%.s, $(OBJ_DIR)/%.o, $(SRC))
EXE = $(BIN_DIR)/$(firstword $(notdir $(SRC:.s=)))

all: directories $(EXE)

directories:
	mkdir -p $(OBJ_DIR) $(BIN_DIR)

$(EXE): $(OBJ)
	$(LD) -o $@ $(OBJ)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	$(AS) $(ASFLAGS) $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
