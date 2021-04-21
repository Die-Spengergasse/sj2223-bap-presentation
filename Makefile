
source := src

output := build

sources := $(wildcard $(source)/*.md)

objects := $(patsubst %.md,%.pdf,$(subst $(source),$(output),$(sources)))

all: $(objects)

$(output)/%.pdf: $(source)/%.md
	pandoc \
		--to=beamer \
		--from=markdown  $< \
		-o $@


$(output)/%.html: $(source)/%.md
	pandoc \
		--variable theme=moon \
		--to=revealjs \
		--standalone \
		--slide-level 2 \
		--from=markdown $< \
		-o $@


$(output)/%.pptx: $(source)/%.md
	pandoc \
		--to=pptx \
		--from=markdown $< \
		-o $@


.PHONY : clean


clean:
	rm -f $(output)/*
