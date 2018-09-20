FOP = fop
XSLTPROC = xsltproc

BASE_DECIMAL = BASE.DECIMAL.18-09-18
RELEASE = 20
DRAFT = 'yes'
FORMAT = espd

ESPD_HOME = ..
FOP_CONFIG = $(ESPD_HOME)/fop.xml
XSL_STYLESHEET = $(ESPD_HOME)/sample.xsl
# XML_CATALOG_FILES="catalog.xml file:///etc/xml/catalog"

XSL_PARAMS = \
	--param double.sided 0 \
	--stringparam draft.mode $(DRAFT) \
	--stringparam admon.graphics 0

FOP_PARAMS = -c $(FOP_CONFIG)

DOCS = Текст_программы.xml \
       Описание_программы.xml \
       Описание_применения.xml \
       Пояснительная_записка.xml

inputs = $(addprefix $(1)/,$(DOCS))
outputs = $(patsubst %.xml, %.pdf, $(call inputs,$(1)))

PROJECTS = $(shell grep -v ^\# projects | csvtool col 1 -)

SRC = $(foreach dir,$(PROJECTS),$(call inputs,$(value dir)))
OUT = $(patsubst %.xml,%.pdf,$(SRC))

deccode = $(shell grep ^$(1), espdcodes | csvtool col 2 -)
decnumber = $(shell grep ^$(1), projects | csvtool col 3 -)
decimal = --stringparam espd.decimal "$(BASE_DECIMAL) $(call deccode,$(1)) $(call decnumber,$(2))"

all: $(OUT) template-project/Спецификация.pdf

$(OUT): Makefile ../espd/*.xsl common.entities espdcodes projects

%.fo: %.xml
	@rc=139; \
	while [ $$rc -eq 139 ]; do \
	$(XSLTPROC) --catalogs --path $(<D) --xinclude $(XSL_PARAMS) $(call decimal,$(<F),$(<D)) -o $@ $(XSL_STYLESHEET) $<; \
	rc=$$?; \
	done

%.pdf: %.fo
	$(FOP) $(FOP_PARAMS) -fo $< -pdf $@
	@rm $<

%.d: %.xml
	@set -e; rm -f $@; \
	echo -n "$(patsubst %.xml,%.pdf,$<) : " > $@; \
	echo -n "$(<D)/project.entities " >> $@; \
	echo -n "$(addprefix "$(<D)/", $(shell $(XSLTPROC) --path $(<D)	xmldepend.xsl $< ))" >> $@


template-project/Спецификация.fo: template-project/Спецификация.xml Makefile ../espd/*.xsl common.entities
	$(XSLTPROC) --catalogs --path $(<D) --xinclude $(XSL_PARAMS) --stringparam generate.toc "book title" --stringparam espd.decimal "$(BASE_DECIMAL)" -o $(<D)/Спецификация.fo $(XSL_STYLESHEET) $<

%.png: ;
%.svg: ;
%.jpg: ;
%.xml: ;

deps: $(patsubst %.xml,%.d,$(SRC))

test:
	$(info output, $(call outputs, shiro))

clean:
	@rm -f $(OUT)
	@rm -f $(patsubst %.xml,%.d,$(SRC))

$(PROJECTS): %: $(call outputs, %)

.PHONY: all protei

.INTERMEDIATE: %.fo

-include $(patsubst %.xml,%.d,$(SRC))
