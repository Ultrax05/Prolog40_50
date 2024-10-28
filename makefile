# Makefile

# Definición de las secuencias
seq_62_63 := $(shell seq 62 63)
seq_67 := $(shell seq 67 67)
seq_70_71 := $(shell seq 70 71)
seq_77_79 := $(shell seq 77 79)
seq_81_82 := $(shell seq 81 82)
# Objetivo principal
all: run_all

# Objetivo que ejecuta todos los programas
run_all: $(addprefix run_programa, $(seq_62_63)) $(addprefix run_programa, $(seq_67)) $(addprefix run_programa, $(seq_70_71)) $(addprefix run_programa, $(seq_77_79)) $(addprefix run_programa, $(seq_81_82)) 

# Regla para ejecutar los programas
run_programa%:
	swipl -s ../Prolog/Programa$(subst run_programa,,$@).pl -g main -t halt

.PHONY: all run_all run_programa% clean

# Objetivo para limpiar archivos generados
clean:
	@echo "Limpiando archivos generados..."
	# Añade comandos de limpieza si es necesario