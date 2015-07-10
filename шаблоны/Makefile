FOP = fop

BASE_DECIMAL = ЕИАУ.360049.001-56-01
RELEASE = 01

ESPD_HOME = ..
FOP_CONFIG = $(ESPD_HOME)/fop.xml
XSL_STYLESHEET = $(ESPD_HOME)/espd/espd.xsl

DATADIR = .
OUTDIR = .

XSL_PARAMS = \
       -param body.font.family 'DejaVu Serif' \
       -param sans.font.family 'Liberation Sans' \
       -param title.font.family 'DejaVu Sans' \
       -param monospace.font.family 'DejaVu Sans Mono' \
       -param symbol.font.family 'OpenSymbol'

FOP_PARAMS = -c $(FOP_CONFIG) -xsl $(XSL_STYLESHEET) $(XSL_PARAMS)

decimal = -param espd.decimal "$(BASE_DECIMAL) $(1) $(2)"


all:
	mkdir -p "$(OUTDIR)"
	$(FOP) $(FOP_PARAMS) $(call decimal,81,01) -xml "пояснительная_записка/book.xml" -pdf "$(OUTDIR)/Пояснительная записка.pdf"

.PHONY:
