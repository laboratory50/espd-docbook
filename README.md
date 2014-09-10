# <docbook>ЕСПД</docbook>

Данный проект предназначен для оформления документации
по стандарту ЕСПД в формате DocBook 5.

## Лицензия

Все материалы распространяются на условиях
стандартной общественной лицензии [GNU (GPL)](http://www.gnu.org/copyleft/gpl.html) версии 3.

Полный текст лиценции находится в файле COPYING.

## Что это такое?

Проект <docbook>ЕСПД</docbook> создан для форматирования документов
в формате DocBook по стандарту ЕСПД. Помимо стилей форматирования
содержит шаблоны наиболее распространенных документов.

В репозитории лежат XSL стили DocBook на основе стандартных стилей
XSL-FO для создания PDF документов. Помимо требований стандарта ЕСПД,
предлагаемый набор стилей старается следовать общим правилам русского
оформления документов.

## Какие требования

Для правильной верстки необходимы:
 * Apache FOP версии 1.1.
 * DocBook XSL версии не менее 1.78.

## Как это использовать?

Стилевые файлы соответствуют стандарту XSL и модифируют стандартный
набор XSL-FO. Генерировать документы можно распространенными XSLT и FO
процессорами. У нас используются xsltproc и Apache FO.

Репозиторий расположен на [BitBucket](https://bitbucket.org/Lab50/espd-docbook5),
склонируйте с помощью Git:
    git clone git@bitbucket.org:Lab50/espd-docbook5.git

Подключить стиль можно с помощью директивы *xml-stylesheet* непосредственно
в вашем документе:

    <?xml version="1.0" encoding="utf-8"?>
    <?xml-model … ?>
    <?xml-stylesheet type="text/xsl" href="~/espd-docbook5/espd/espd.xsl"?>
    <book>
     …
    </book>

Или непосредственно в командной строке процессора.

    xsltproc ~/espd-docbook5/espd/espd.xsl mybook.xml

или Apache FOP:

    fop -catalog -xml mybook.xml -xsl ~/espd-docbook5/espd/espd.xsl -pdf mybook.pdf

Стилевые файлы располагаются по адресу http://lab50.net/xsl/espd/. Например, вы
можете включить в ваше описание стиля:

    <xsl:import href="http://lab50.net/xsl/espd/espd.xsl"/>

### Стилевые параметры

Стиль <docbook>ЕСПД</docbook> содержит ряд параметров с помощью
хоторых можно влиять на выходное оформление.

 *  *espd.decimal*
    Децимальный номер документа.

 *  *espd.lri*
    Создание листа регистрации изменений (включено).

 *  *espd.text-indent*
    Абзацный отступ. Помимо абзацев используется для выравнивания
    многих элементов (перечислений, названий разделов).

 *  *espd.heading.font.family*
    Шрифт колонтитулов. Стандартное значение — title.font.family.

 *  *espd.verbatim.font.size* 
    Размер шрифта для блоков машинного текста (programlisting и т.п.).
    Стандартное значение 0,9em.

### Лист утверждения и титульный лист

В версии 0.3 появилась возможность создания листа утверждения по требованиям ЕСПД.
В терминах DocBook лист утверждения является титульным листом *recto*, а
настоящий титульный лист — *verso*. Для отключения листа утверждения
можно просто отключить `book.titlepage.recto` в вашем стилевом файле:

    <xsl:template name="book.titlepage.recto"/>
    <xsl:template name="book.titlepage.before.recto"/>

Для всех титульных страниц оформление устанавливается набором `espd.titlepage.style`.

Набор из автора, нормоконтроллера, утверждающего и пр. определяется элементами в
`<authorgroup>`. В шапку утверждающим выносится `<editor>`, также должен присутствовать
элемент `<author>`. Любые иные уважаемые персоны (в любом количестве) должны
определяться элементами `<othercredit>`.

Каждый обозначенный элемент должен содержать `<personname>`, включая
`<firstname>`, `<surname>`, `<othername>`, а также элемент `<personblurb>`, описывающий
должность персонажа.

Примерчик:

    <authorgroup>
        <author>
            <personname>
                <firstname>Василий</firstname>
                <surname>Шлыков</surname>
                <othername>Александрович</othername>
            </personname>
            <personblurb><para>Исполнитель</para></personblurb>
        </author>
        <editor>
            <personname>
                <firstname>Иоанн</firstname>
                <surname>Грозный</surname>
                <othername>Васильевич</othername>
            </personname>
            <personblurb><para>Царь</para></personblurb>
        </editor>
        <othercredit>
            <personname>
                <firstname>Лев</firstname>
                <surname>Мышкин</surname>
                <othername>Николаевич</othername>
            </personname>
            <personblurb><para>Начальник «Лаборатории 50», князь</para></personblurb>
        </othercredit>
    </authorgroup>

Для того, чтобы внизу страницы печатался год, необходимо добавить элемент `<pubdate>`,
например:

    <pubdate><?dbtimestamp format="Y"?></pubdate>
