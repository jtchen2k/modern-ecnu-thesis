TYP_SRC = $(shell find . -name '*.typ')
TARGET = thesis.pdf

$(TARGET): $(TYP_SRC)
	typst compile thesis.typ --pdf-standard 1.7 --root ..

.PHONY: clean, watch
clean:
	rm -f $(TARGET)

watch:
	typst watch thesis.typ --root ..