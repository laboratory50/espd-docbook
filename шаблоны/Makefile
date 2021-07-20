FOP = fop
XSLTPROC = xsltproc

TU_DECIMAL = ШБЛН.070219-001
BASE_DECIMAL = ШБЛН.070219
RELEASE = 20
DRAFT = 'no'
FORMAT = espd

ESPD_HOME = ..
FOP_CONFIG = $(ESPD_HOME)/fop.xml
XSL_STYLESHEET = $(ESPD_HOME)/$(FORMAT)-sample.xsl

XSL_PARAMS = \
        --param keep.relative.image.uris 1 \
	--stringparam img.src.path "../template-project/" \
	--param double.sided 0 \
	--stringparam draft.mode $(DRAFT) \
	--stringparam admon.graphics 0

FOP_PARAMS = -c $(FOP_CONFIG)

DOCS = Технические_условия.xml \
       Спецификация.xml \
       Формуляр.xml \
       Текст_программы.xml \
       Описание_программы.xml \
       Описание_применения.xml \
       Пояснительная_записка.xml \
       Программа_и_методика_испытаний.xml \
       Ведомость_эксплуатационных_документов.xml

inputs = $(addprefix $(1)/,$(DOCS))
outputs = $(patsubst %.xml, %.pdf, $(call inputs,$(1)))

PROJECTS = $(shell grep -v ^\# projects | csvtool col 1 -)

SRC = $(foreach dir,$(PROJECTS),$(call inputs,$(value dir)))
OUT = $(patsubst %.xml,%.pdf,$(SRC))
OUT_ESPD = $(patsubst template-project/%.xml,espd/%.pdf,$(SRC))
OUT_ESKD = $(patsubst template-project/%.xml,eskd/%.pdf,$(SRC))
OUT_MODERN = $(patsubst template-project/%.xml,modern/%.pdf,$(SRC))

deccode = $(shell grep ^$(1), espdcodes | csvtool col 2 -)
decnumber = $(shell grep ^$(1), projects | csvtool col 3 -)
decimal = --stringparam espd.decimal "$(BASE_DECIMAL) $(call deccode,$(1)) $(call decnumber,$(2))"

all: $(OUT)

$(OUT_ESPD): Makefile ../espd/**/*.xsl common.entities espdcodes projects

%.fo: %.xml
	@rc=139; \
	while [ $$rc -eq 139 ]; do \
	$(XSLTPROC) --catalogs --path template-project --xinclude $(XSL_PARAMS) $(call decimal,$(<F),$(<D)) -o $@ $(XSL_STYLESHEET) template-project/$(<F); \
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


$(FORMAT)/Спецификация.fo: template-project/Спецификация.xml Makefile ../espd/*.xsl common.entities
	$(XSLTPROC) --catalogs --path $(<D) --xinclude $(XSL_PARAMS) --stringparam generate.toc "book title" --stringparam espd.decimal "$(BASE_DECIMAL)" -o $@ $(XSL_STYLESHEET) $<;

eskd/Технические_условия.fo espd/Технические_условия.fo: template-project/Технические_условия.xml
	$(XSLTPROC) --catalogs --path $(<D) --xinclude $(XSL_PARAMS) --stringparam espd.decimal "$(TU_DECIMAL) ТУ" -o $@ $(ESPD_HOME)/eskd-sample.xsl $<;
	
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

espd: FORMAT=espd
eskd: FORMAT=eskd
modern: FORMAT=modern

espd: $(OUT_ESPD)
eskd: $(OUT_ESKD)
modern: $(OUT_MODERN)

.PHONY: all clean espd eskd modern

.INTERMEDIATE: %.fo

-include $(patsubst %.xml,%.d,$(SRC))
