TYP_SRC = $(shell find . -name '*.typ')

TARGET = thesis.pdf
TARGET_TYP = thesis.typ

$(TARGET): $(TYP_SRC)
	typst compile --pdf-standard 1.7 $(TARGET_TYP) --root ..
	@echo "Build successful: $(shell du -h $(TARGET_TYP) | cut -f1)"

.PHONY: clean, watch, count
clean:
	rm -f $(TARGET)

watch:
	typst watch --root .. --pdf-standard 1.7 $(TARGET_TYP)

# Count words and characters in mainmatter and backmatter
count:
	@echo "#words: $(shell typst query $(TARGET_TYP) '<total-words>' 2>/dev/null --field value --one)"
	@echo "#chars: $(shell typst query $(TARGET_TYP) '<total-chars>' 2>/dev/null --field value --one)"