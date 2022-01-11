
<!-- README.md is generated from README.Rmd. Please edit that file -->

``` r
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
library(actdata)
```

# actdata

<!-- badges: start -->
<!-- badges: end -->

This package is intended to be a repository for standardized versions of
all publicly released affect control theory dictionaries and equations,
which span nearly 45 years and multiple cultures around the world. These
datasets can be used by affect control theorists to understand the
cultural meaning of objects and events, as well as how these meanings
vary across time and place. Within affect control theory, a social
psychological theory of cultural meaning and interaction, words
describing identities and behaviors have meanings on three dimensions of
sentiment: evaluation (good vs bad), potency (powerful vs weak), and
activity (active vs passive). Affect control theory dictionaries contain
these evaluation, potency, and activity (EPA) values for a variety of
terms. Equations describe how different terms work together to create
meaning in the context of events. For more information about affect
control theory, see
[affectcontroltheory.org](http://affectcontroltheory.org/the-theory/overview/)
and the many academic resources that it links to.

Many affect control theory datasets have been publicly released by
researchers, facilitating new research in the tradition. However, these
datasets are stored in several different places and in several different
formats. The actdata R package standardizes them and brings them
together in one place in order to make them easier to access and make
part of a reproducible analysis workflow. Details on standardization
procedures for dictionaries and equation sets, instructions for how to
access the data in this package, and a worked example using the
Tidyverse to manipulate these datasets are provided below.

## Installation

You can install the development version of actdata from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ahcombs/actdata")
```

## Dictionary Data

This package contains data from 24 different publicly available affect
control theory dictionary datasets. Metadata for these datasets is shown
in the table below. More detail on each of the columns is included below
the table.

<table class="table" style="font-size: 10px; margin-left: auto; margin-right: auto;">
<thead>
<tr>
<th style="text-align:left;">
Dataset key
</th>
<th style="text-align:left;">
Country or context
</th>
<th style="text-align:left;">
Year
</th>
<th style="text-align:left;">
Data types
</th>
<th style="text-align:left;">
Components
</th>
<th style="text-align:left;">
Genders
</th>
<th style="text-align:left;">
Description
</th>
<th style="text-align:left;">
Notes
</th>
<th style="text-align:left;">
Source
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
dukecommunity2015
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
2015
</td>
<td style="text-align:left;">
mean, sd, cov, individual
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
average
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<http://affectcontroltheory.org///usa-combined-surveyor-dictionary-2015/>
</td>
</tr>
<tr>
<td style="text-align:left;">
dukestudent2015
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
2015
</td>
<td style="text-align:left;">
mean, sd, cov, individual
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
average
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<http://affectcontroltheory.org///usa-combined-surveyor-dictionary-2015/>
</td>
</tr>
<tr>
<td style="text-align:left;">
china1999
</td>
<td style="text-align:left;">
China
</td>
<td style="text-align:left;">
1999
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior, modifier, setting
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
From <https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html>:
Ratings of 449 Identities, 300 Behaviors, 98 Emotions, 150 Traits, and
149 Settings were obtained with Attitude from about 380 undergraduate
students at Fudan University in Shanghai, Peoples Republic of China,
1999-2000.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Interact 2.1 beta (May 2021)
</td>
</tr>
<tr>
<td style="text-align:left;">
egypt2015
</td>
<td style="text-align:left;">
Egypt
</td>
<td style="text-align:left;">
2012-2014
</td>
<td style="text-align:left;">
mean, sd, cov, individual
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
average
</td>
<td style="text-align:left;">
Data collected in Egypt between 2012 and 2014. n = 1716, identities =
397, behaviors = 368, modifiers = 233
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<http://affectcontroltheory.org///egypt-dictionary-2015/>
</td>
</tr>
<tr>
<td style="text-align:left;">
expressive2002
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
2002
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
behavior
</td>
<td style="text-align:left;">
average
</td>
<td style="text-align:left;">
Appendix of Lisa Slattery Rashotte, 2002, What does that smile mean? The
meaning of nonverbal behaviors in social interaction. Social Psychology
Quarterly 65: 92-102. EPA values are means across 230 females and 172
males; these cross-sex EPA profiles are given in both the “male” and the
“female” positions.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/expressive_acts.htm>
</td>
</tr>
<tr>
<td style="text-align:left;">
gaymensanfrancisco1980
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
1980
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
behavior
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
Data were gathered from ten San Francisco gay men in the 1980s by
Professor Don Barrett, California State University, San Marcos. All data
are from males. The ‘male’ dictionary present the mean EPA ratings of
those with traditional sentiments about unsafe sex practices, feeling
that those practices are more pleasurable than new practices. The
‘female’ dictionary shows the sentiments of those who think that
safe-sex practices are more pleasurable.
</td>
<td style="text-align:left;">
All respondents are men. “Male” and “female” sets are coded this way for
compatibility with Interact.
</td>
<td style="text-align:left;">
<https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/gay_sex.htm>
</td>
</tr>
<tr>
<td style="text-align:left;">
germany1989
</td>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:left;">
1989
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
From <https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html>:
Ratings of 442 Identities, 295 Behaviors, and 67 Modifiers, selected for
back-translatability with the 1978 U.S.A. dictionary were obtained with
the Attitude program from 520 Mannheim students. Subjects were matched
to the American undergraduate population by proportional inclusion of 12
and 13 grade youths at two German Studenten des Grundstudiums and
Gymnasiasten, along with subjects from Mannheim University, which
attracts students mainly from the Rhein-Neckar region in former West
Germany.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Interact 2.1 beta (May 2021)
</td>
</tr>
<tr>
<td style="text-align:left;">
germany2007
</td>
<td style="text-align:left;">
Germany
</td>
<td style="text-align:left;">
2007
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior, modifier, setting
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
From <https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html>:
Ratings of 376 Identities, 393 Behaviors, 331 Modifiers. (Some of the
words are classified as 19 settings in Interact.) Ratings were obtained
with Surveyor from 1905 subjects (734 male and 1171 female) from all
over Germany. The research was advertised as a ‘study of language and
emotion’ in an extensive recruitment campaign including mailing lists
from different universities, weblogs, newspaper reports and radio
interviews. Most of the participants (N = 1029) were between 20 and 29
years of age, but the sample covered all ages, including N = 129 being
younger than 20 and N = 92 older than 60 years. The data of 83 persons
(4.4 %) were excluded from the analysis, as they had indicated German
not being their mother tongue.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Interact 2.1 beta (May 2021)
</td>
</tr>
<tr>
<td style="text-align:left;">
household1994
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
1994
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
This set of concepts - developed by Professor Amy Kroska at the
University of Oklahoma, and others, for studying gender and household
roles - was rated by 23 male and 46 female college students in 1994.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/household.htm>
</td>
</tr>
<tr>
<td style="text-align:left;">
indiana2003
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
2003
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior, modifier, setting
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
From <https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html>:
Ratings of 500 Identities, 500 Behaviors, 300 Modifiers, and 200
Settings were collected at Indiana University, via the Internet using
the Surveyor applet. The 1027 respondents lived in the U.S.A. at age 16,
and were about equally male and female.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Interact 2.1 beta (May 2021)
</td>
</tr>
<tr>
<td style="text-align:left;">
internationaldomesticrelations1981
</td>
<td style="text-align:left;">
Unknown
</td>
<td style="text-align:left;">
1981
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
behavior
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
125 inter-state behaviors and 113 domestic behaviors. The behaviors were
rated by professionals in international relations, and by individuals
from the general population.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/international_relations.htm>
</td>
</tr>
<tr>
<td style="text-align:left;">
internet1998
</td>
<td style="text-align:left;">
Internet
</td>
<td style="text-align:left;">
1998
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior, setting
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
This set of concepts related to Internet culture was developed by Adam
King, and rated by 2,431 respondents (56% male and 44% female) in 1998.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/InternetCulture.htm>
</td>
</tr>
<tr>
<td style="text-align:left;">
japan1995
</td>
<td style="text-align:left;">
Japan
</td>
<td style="text-align:left;">
1989-2002
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior, modifier, setting
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
From <https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html>:
Ratings of 403 Identities and 307 Behaviors, and a few Settings were
obtained with the Attitude program from 323 Tohoku University students
in 1989. In 1995 and 1996, 120 women students at Kyoritsu Women’s, Japan
Women’s, and Teikyo Universities and 120 men students at Teikyo and
Rikkyo Universities rated an additional 300 settings, 300 modifiers
(mainly traits), 200 business identities, and 75 behaviors. Yoichi
Murase (Rikkyo University) and Nozomu Matsubara (Tokyo University)
provided access to students who rated 102 emotions, 70 behaviors and 55
identities in 2002 using Surveyor. Total numbers of entries in Interact
lexicon are: 713 Identities, 455 Behaviors, 426 Modifiers, and 300
Settings. Number of male or female raters generally is about 30 for each
concept.
</td>
<td style="text-align:left;">
Data collection was in several stages between 1989 and 2002
</td>
<td style="text-align:left;">
Interact 2.1 beta (May 2021)
</td>
</tr>
<tr>
<td style="text-align:left;">
morocco2015
</td>
<td style="text-align:left;">
Morocco
</td>
<td style="text-align:left;">
2015
</td>
<td style="text-align:left;">
mean, sd, cov, individual
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
average
</td>
<td style="text-align:left;">
Data collected in Morocco. n = 1546, identities = 397, behaviors = 368,
modifiers = 233
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<http://affectcontroltheory.org///morocco-dictionary-2015/>
</td>
</tr>
<tr>
<td style="text-align:left;">
nc1978
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
1978
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior, modifier, setting
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
From <https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html>:
Ratings of 721 Identities, 600 Behaviors, 440 Modifiers, and 345
Settings were obtained with paper questionnaires from 1,225 North
Carolina undergraduates. (Ratings for some emotion words in this data
set were obtained by Heise from Indiana University undergraduates in
1985.) Number of male or female raters generally is about 25 for each
word. Funded by National Institute of Mental Health Grant
1-R01-MH29978-01-SSR.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Interact 2.1 beta (May 2021)
</td>
</tr>
<tr>
<td style="text-align:left;">
nireland1977
</td>
<td style="text-align:left;">
North Ireland
</td>
<td style="text-align:left;">
1977
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
From <https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html>:
Ratings of 528 Identities and 498 Behaviors were obtained with paper
questionnaires from 319 Belfast teenagers in Catholic high schools in
1977. Ratings of modifiers and settings were not obtained in the Belfast
study. Up to 18 females and 14 males rated each concept.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Interact 2.1 beta (May 2021)
</td>
</tr>
<tr>
<td style="text-align:left;">
ontario1980
</td>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:left;">
1980
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
From <https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html>:
Data on 843 Identities and 593 Behaviors were obtained from 5,534
Guelph, Ontario, undergraduates with paper questionnaires in 1980-3, and
495 Modifiers rated by 1,260 Guelph undergraduates were added in 1985-6.
Funded by the Social Science and Humanities Research Council of Canada.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Interact 2.1 beta (May 2021)
</td>
</tr>
<tr>
<td style="text-align:left;">
ontario2001
</td>
<td style="text-align:left;">
Canada
</td>
<td style="text-align:left;">
2001
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior, modifier, setting
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
From <https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html>:
Data on 993 Identities, 601 Behaviors, and 500 Modifiers, and 200
Settings were gathered with the Attitude program from Guelph, Ontario,
undergraduates in 2001-2. Data on settings were gathered with the
Surveyor program at Guelph in 2003. Funded by the Social Science and
Humanities Research Council of Canada.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Interact 2.1 beta (May 2021)
</td>
</tr>
<tr>
<td style="text-align:left;">
politics2003
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
2003
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
This set of concepts - developed by Kyle Irwin at the University of
Missouri-St. Louis - was rated by 47 male and 74 female college students
in 2003.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/politics.htm>
</td>
</tr>
<tr>
<td style="text-align:left;">
texas1998
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
1998
</td>
<td style="text-align:left;">
mean
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
male, female, average
</td>
<td style="text-align:left;">
From <https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html>:
Ratings of 443 Identities, 278 Behaviors, 65 Modifiers, and 1 Setting
were collected at Texas Tech University with the Attitude program. The
482 respondents were nearly equally male and female.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
Interact 2.1 beta (May 2021)
</td>
</tr>
<tr>
<td style="text-align:left;">
uga2015
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
2015
</td>
<td style="text-align:left;">
mean, sd, cov, individual
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
average
</td>
<td style="text-align:left;">
Sentiment dictionary data collected at the University of Georgia. n =
1368, identities = 930, behaviors = 814, modifiers = 660
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<http://affectcontroltheory.org///usa-georgia-dictionary-2015/>
</td>
</tr>
<tr>
<td style="text-align:left;">
usfullsurveyor2015
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
2015
</td>
<td style="text-align:left;">
mean, sd, cov, individual
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
average
</td>
<td style="text-align:left;">
Combined sentiment dictionary data collected at the University of
Georgia, Duke University, and in the Durham, NC community using
Surveyor. n = 1742, identities = 929, behaviors = 814, modifiers = 660
</td>
<td style="text-align:left;">
A combination of the 2015 Duke student, 2015 UGA student, and 2015 Duke
community dictionaries
</td>
<td style="text-align:left;">
<http://affectcontroltheory.org///usa-combined-surveyor-dictionary-2015/>
</td>
</tr>
<tr>
<td style="text-align:left;">
usmturk2015
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
2015
</td>
<td style="text-align:left;">
mean, sd, cov, individual
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
average
</td>
<td style="text-align:left;">
Collected from Amazon Mechanical Turk workers in 2015. Identities = 968,
behaviors = 853, modifiers = 660.
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<http://affectcontroltheory.org///usa-online-dictionary-2015/>
</td>
</tr>
<tr>
<td style="text-align:left;">
usstudent2015
</td>
<td style="text-align:left;">
US
</td>
<td style="text-align:left;">
2015
</td>
<td style="text-align:left;">
mean, sd, cov, individual
</td>
<td style="text-align:left;">
identity, behavior, modifier
</td>
<td style="text-align:left;">
average
</td>
<td style="text-align:left;">
Combined sentiment dictionary data collected at the University of
Georgia and Duke University using Surveyor. n = 1584, identities = 929,
behaviors = 814, modifiers = 660
</td>
<td style="text-align:left;">
A combination of the 2015 Duke student and 2015 UGA student dictionaries
</td>
<td style="text-align:left;">
<http://affectcontroltheory.org///usa-student-surveyor-dictionary-2015/>
</td>
</tr>
</tbody>
</table>

-   *Dataset key*: an identifier unique to a particular study
    (e.g. `nc1978`; `morocco2015`). These keys are used within this
    package’s functions to access particular datasets.
-   *Country or context*: The country (or other context, such as the
    Internet) where the data was originally collected.
-   *Year*: The year of data collection. In some cases these are
    approximate; always check original sources for definitive
    information.
-   *Data types*: This column indicates what types of summary data are
    available in a dictionary. Most older dictionaries (pre-2015)
    provide term EPA values only as `mean` values. For some more recent
    datasets, standard deviation (`sd`) and covariance (`cov`)
    information is also available. This column also indicates whether
    `individual`-level data is available in addition to summary
    statistics. Most research in the affect control theory tradition has
    utilized just mean values, but some recent work (e.g., [Rogers
    2019](https://doi.org/10.1177/2329496518805688)) and BayesACT
    ([Schröder, Hoey, and Rogers
    2016](https://doi.org/10.1177/0003122416650963)), a recent Bayesian
    extension of the theory, have used variance information and
    individual-level responses to investigate topics like demographic
    patterning in meaning and the effects of meaning uncertainty.
-   *Component*: indicates what kind of terms are included in the
    dictionary dataset. Typically, studies provide dictionary datasets
    with more than one component, but not all studies provide all
    possible components. Components include:
    -   *identity:* Words that describe actors. Typically nouns
        (e.g. academic, woman, youngster)
    -   *behavior:* Actions that actors can perform. Typically verbs
        (e.g. wheedle, acclaim, work)
    -   *modifier:* Typically adjectives that can be applied to
        identities (e.g. active, witty, young)
    -   *setting:* Places and situations (e.g. airplane, alley,
        worship_service)
-   *Genders*: indicates available gender subsets. Options are `male`,
    `female`, and `average`. “Average” indicates that participants of
    all genders were included, though the way this is calculated differs
    slightly by dictionary. Some dictionaries (e.g. the 2015 US,
    Morocco, and Egypt dictionaries) are originally published as average
    values over raters of all genders. In these cases, `average` is the
    only provided option. Other dictionaries are originally published in
    male and female subsets. Average values over all raters are not
    provided in these originally published sets. In this case, the
    package calculates an approximate average by averaging the male and
    female values. Typically, studies recruit approximately equal
    numbers of men and women and men and women’s ratings do not differ
    substantially on most terms, so we expect these approximate average
    values to be reasonably close to those that we would obtain from an
    average over all raters. For these dictionaries that provide male
    and female subsets separately, the package provides male, female,
    and approximate average versions. For more information on gender and
    affect control theory dictionaries, see section 4.1 of David Heise’s
    *Expressive Order* (2007).
-   *Description*: Any summary information provided in the original
    source.
-   *Citation*: Citation information for the original source, as
    provided by that source (if any).
-   *Source*: Where the raw data for the package was downloaded or
    otherwise obtained from. These sources are for mean values; all
    individual data, none of which has previously been made publicly
    available, was obtained through personal communications.

Within R, this same metadata information can be printed to the console
using dict_info().

``` r
library(actdata)
dict_info("nc1978")
#> Dictionary: nc1978
#> Country or context: US
#> Year: 1978
#> Description: From https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/data.html: Ratings of 721 Identities, 600 Behaviors, 440 Modifiers, and 345 Settings were obtained with paper questionnaires from 1,225 North Carolina undergraduates. (Ratings for some emotion words in this data set were obtained by Heise from Indiana University undergraduates in 1985.) Number of male or female raters generally is about 25 for each word. Funded by National Institute of Mental Health Grant 1-R01-MH29978-01-SSR.
#> Components: identity, behavior, modifier, setting
#> Genders: male, female, average
#> Types: mean
#> Source: Interact 2.1 beta (May 2021)
#> Citation: Smith-Lovin, Lynn, and David R. Heise. Mean Affective Ratings of 2,106 Concepts by University of North Carolina Undergraduates in 1978 [Computer file]. Distributed at Affect Control Theory Website, Program Interact <http://www.indiana.edu/~socpsy/ACT/interact/JavaInteract.html>, 2006.
#> Notes:
dict_info("politics2003")
#> Dictionary: politics2003
#> Country or context: US
#> Year: 2003
#> Description: This set of concepts - developed by Kyle Irwin at the University of Missouri-St. Louis - was rated by 47 male and 74 female college students in 2003.
#> Components: identity, behavior
#> Genders: male, female, average
#> Types: mean
#> Source: https://cs.uwaterloo.ca/~jhoey/research/ACTBackup/ACT/interact/subcultures/politics.htm
#> Citation: 
#> Notes:
```

### Accessing dictionary data: summary statistics

Within the package, all summary data is stored in one data frame named
`epa_summary_statistics`. This dataframe contains all available EPA
means and variances, covariances, and respondent numbers (when
available) for all terms in all dictionaries.

Researchers will rarely need or want to work with all of these data at
one time. To easily build subsets of this dataframe, use the
`epa_subset()` function. This function allows users to search by term,
filter by dataset, return only certain summary statistics, and more.
Both the original dataframe and these subsets are provided in long form,
making them easy to manipulate further using the Tidyverse if needed.

``` r
# Return all gender-average entries for terms containing "friend"
contains_friend <- epa_subset(expr = "friend", gender = "average")
head(contains_friend)
#> # A tibble: 6 × 25
#>   term    dataset   context year  component gender     E     P     A   n_E   n_P
#>   <chr>   <chr>     <chr>   <chr> <chr>     <chr>  <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 befrie… china1999 China   1999  behavior  avera…  2.04 1.44   1.69    NA    NA
#> 2 boyfri… china1999 China   1999  identity  avera…  2.07 2.09   2.04    NA    NA
#> 3 friend… china1999 China   1999  modifier  avera…  2.18 1.47   1.66    NA    NA
#> 4 girlfr… china1999 China   1999  identity  avera…  2.67 0.525  2.02    NA    NA
#> 5 befrie… dukecomm… US      2015  behavior  avera…  0.74 0.64  -0.37     7     7
#> 6 best_f… dukecomm… US      2015  identity  avera…  3.68 2.77   1.07    22    22
#> # … with 14 more variables: n_A <dbl>, sd_E <dbl>, sd_P <dbl>, sd_A <dbl>,
#> #   cov_EE <dbl>, cov_EP <dbl>, cov_EA <dbl>, cov_PE <dbl>, cov_PP <dbl>,
#> #   cov_PA <dbl>, cov_AE <dbl>, cov_AP <dbl>, cov_AA <dbl>, instcodes <chr>

# Return all entries for the identity "friend"
friend <- epa_subset(expr = "^friend$", component = "identity")
head(friend)
#> # A tibble: 6 × 25
#>   term   dataset    context year  component gender     E     P     A   n_E   n_P
#>   <chr>  <chr>      <chr>   <chr> <chr>     <chr>  <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 friend dukecommu… US      2015  identity  avera…  3.15  2.7   0.77     6     6
#> 2 friend dukestude… US      2015  identity  avera…  3.11  2.41  1.21     8     8
#> 3 friend egypt2015  Egypt   2015  identity  avera…  2.95  2.49  0.27    83    83
#> 4 friend germany19… Germany 1989  identity  avera…  3.43  1.34 -0.11    NA    NA
#> 5 friend germany19… Germany 1989  identity  male    3.3   1.02 -0.13    NA    NA
#> 6 friend germany19… Germany 1989  identity  female  3.56  1.65 -0.09    NA    NA
#> # … with 14 more variables: n_A <dbl>, sd_E <dbl>, sd_P <dbl>, sd_A <dbl>,
#> #   cov_EE <dbl>, cov_EP <dbl>, cov_EA <dbl>, cov_PE <dbl>, cov_PP <dbl>,
#> #   cov_PA <dbl>, cov_AE <dbl>, cov_AP <dbl>, cov_AA <dbl>, instcodes <chr>

# Return the entire Ontario 1980 dataset
all_ontario1980 <- epa_subset(dataset = "ontario1980")
head(all_ontario1980)
#> # A tibble: 6 × 25
#>   term      dataset context year  component gender     E     P     A   n_E   n_P
#>   <chr>     <chr>   <chr>   <chr> <chr>     <chr>  <dbl> <dbl> <dbl> <dbl> <dbl>
#> 1 abandon   ontari… Canada  1980  behavior  avera… -2.74  0.01  0.74    NA    NA
#> 2 abandon   ontari… Canada  1980  behavior  male   -2.64 -0.04  0.82    NA    NA
#> 3 abandon   ontari… Canada  1980  behavior  female -2.84  0.06  0.66    NA    NA
#> 4 abandoned ontari… Canada  1980  modifier  avera… -2.68 -1.40 -0.59    NA    NA
#> 5 abandoned ontari… Canada  1980  modifier  male   -2.71 -1.46 -0.43    NA    NA
#> 6 abandoned ontari… Canada  1980  modifier  female -2.64 -1.33 -0.75    NA    NA
#> # … with 14 more variables: n_A <dbl>, sd_E <dbl>, sd_P <dbl>, sd_A <dbl>,
#> #   cov_EE <dbl>, cov_EP <dbl>, cov_EA <dbl>, cov_PE <dbl>, cov_PP <dbl>,
#> #   cov_PA <dbl>, cov_AE <dbl>, cov_AP <dbl>, cov_AA <dbl>, instcodes <chr>

# Return this same dataset, but only include the female mean values for behaviors
f_mean_ontario1980 <- epa_subset(dataset = "ontario1980", gender = "female", component = "behavior", stat = "mean")
head(f_mean_ontario1980)
#> # A tibble: 6 × 10
#>   term        dataset context year  component gender     E     P     A instcodes
#>   <chr>       <chr>   <chr>   <chr> <chr>     <chr>  <dbl> <dbl> <dbl> <chr>    
#> 1 abandon     ontari… Canada  1980  behavior  female -2.84  0.06  0.66 " 01 111…
#> 2 abuse       ontari… Canada  1980  behavior  female -3.03  1.21  1.88 " 10 101…
#> 3 acclaim     ontari… Canada  1980  behavior  female  1.9   0.8   0    " 10 000…
#> 4 accommodate ontari… Canada  1980  behavior  female  2.31  0.87  0.12 " 10 111…
#> 5 accuse      ontari… Canada  1980  behavior  female -1.73  0.97  0.85 " 10 111…
#> 6 address     ontari… Canada  1980  behavior  female  1.36  0.36 -0.15 " 10 111…
```

### Accessing dictionary data: individual-level data

Eight datasets, all from around 2015, include individual-level data.
Some of these are subsets of others. These are the following (see the
dictionary table above or use `dict_info()` for more information):

1.  morocco2015
2.  egypt2015
3.  usmturk2015
4.  dukestudent2015
5.  uga2015
6.  dukecommunity2015
7.  usstudent2015 (a combination of 4 and 5)
8.  usfullsurveyor2015 (a combination of 4, 5, and 6)

Access these data by calling the desired set using the format
`[key]_individual`. These datasets contain different sets of
respondent-level covariates. For summary information, use `?` preceding
a dataset name–for example, enter `?dukecommunity_individual` to see
documentation for the Duke community dataset.

Like the summary datasets, these datasets are provided in long form,
with one respondent’s ratings of one term per row.

``` r
head(usfullsurveyor2015_individual)
#>         term UserID Gender age      grade hispanic                   race1
#> 1 fun_loving   UGA1 Female  18 First-Year       No Asian or Asian American
#> 2    curious   UGA1 Female  18 First-Year       No Asian or Asian American
#> 3        bad   UGA1 Female  18 First-Year       No Asian or Asian American
#> 4 wallflower   UGA1 Female  18 First-Year       No Asian or Asian American
#> 5      exalt   UGA1 Female  18 First-Year       No Asian or Asian American
#> 6       jock   UGA1 Female  18 First-Year       No Asian or Asian American
#>                                      race2 usborn proportionus
#> 1 No additional race information to report    Yes      91-100%
#> 2 No additional race information to report    Yes      91-100%
#> 3 No additional race information to report    Yes      91-100%
#> 4 No additional race information to report    Yes      91-100%
#> 5 No additional race information to report    Yes      91-100%
#> 6 No additional race information to report    Yes      91-100%
#>                                    livedprior language         parentinc
#> 1 South Atlantic = DE MD WV VA NC SC GA FL DC  English Prefer not to say
#> 2 South Atlantic = DE MD WV VA NC SC GA FL DC  English Prefer not to say
#> 3 South Atlantic = DE MD WV VA NC SC GA FL DC  English Prefer not to say
#> 4 South Atlantic = DE MD WV VA NC SC GA FL DC  English Prefer not to say
#> 5 South Atlantic = DE MD WV VA NC SC GA FL DC  English Prefer not to say
#> 6 South Atlantic = DE MD WV VA NC SC GA FL DC  English Prefer not to say
#>   parentmarital                             momed           daded      momemp
#> 1       Married Some college or vocational school Master's degree Not working
#> 2       Married Some college or vocational school Master's degree Not working
#> 3       Married Some college or vocational school Master's degree Not working
#> 4       Married Some college or vocational school Master's degree Not working
#> 5       Married Some college or vocational school Master's degree Not working
#> 6       Married Some college or vocational school Master's degree Not working
#>                            dademp home             home2          business
#> 1 Unemployed or looking for a job  Yes Prefer not to say Prefer not to say
#> 2 Unemployed or looking for a job  Yes Prefer not to say Prefer not to say
#> 3 Unemployed or looking for a job  Yes Prefer not to say Prefer not to say
#> 4 Unemployed or looking for a job  Yes Prefer not to say Prefer not to say
#> 5 Unemployed or looking for a job  Yes Prefer not to say Prefer not to say
#> 6 Unemployed or looking for a job  Yes Prefer not to say Prefer not to say
#>       religion                     services          otherrelig
#> 1 Christianity a few times in the past year A few times a month
#> 2 Christianity a few times in the past year A few times a month
#> 3 Christianity a few times in the past year A few times a month
#> 4 Christianity a few times in the past year A few times a month
#> 5 Christianity a few times in the past year A few times a month
#> 6 Christianity a few times in the past year A few times a month
#>              relimp Condition          E          P          A Set component
#> 1 Prefer not to say         8  4.1999998       2.04          0 UGA  modifier
#> 2 Prefer not to say         8        2.5          2       1.02 UGA  modifier
#> 3 Prefer not to say         8 -2.4000001        .02  .31999999 UGA  modifier
#> 4 Prefer not to say         8 -.95999998          2       -.94 UGA  identity
#> 5 Prefer not to say         8  .98000002       1.14 .059999999 UGA  behavior
#> 6 Prefer not to say         8        .02 .039999999       2.98 UGA  identity
```

### Term table

One of the main goals of this package is to make it easy to compare
across dictionaries. To this end, the package provides a dataframe
called `term_table` that shows at a glance which terms are included in
which dictionaries. Each column in these tables represents a dictionary
(labeled with its key) and each row is a term. Cell entries (0/1)
indicate whether or not the specified dictionary has the specified term.
These tables can easily be modified further to generate summaries across
a set of dictionaries of interest. To see the entries for only a
particular component, to search by term, or to limit to a particular set
of dictionaries, I recommend using simple Tidyverse functions to filter
the term table.

``` r
# the whole table
head(term_table)
#> # A tibble: 6 × 26
#>   term          component china1999 dukecommunity2015 dukestudent2015 egypt2015
#>   <chr>         <chr>         <dbl>             <dbl>           <dbl>     <dbl>
#> 1 abandon       behavior          1                 1               1         1
#> 2 abduct        behavior          1                 1               1         0
#> 3 able_bodied   modifier          1                 1               1         0
#> 4 abortionist   identity          1                 1               1         1
#> 5 absent_minded modifier          1                 1               1         0
#> 6 abuse         behavior          1                 1               1         1
#> # … with 20 more variables: expressive2002 <dbl>, gaymensanfrancisco1980 <dbl>,
#> #   germany1989 <dbl>, germany2007 <dbl>, household1994 <dbl>,
#> #   indiana2003 <dbl>, internationaldomesticrelations1981 <dbl>,
#> #   internet1998 <dbl>, japan1995 <dbl>, morocco2015 <dbl>, nc1978 <dbl>,
#> #   nireland1977 <dbl>, ontario1980 <dbl>, ontario2001 <dbl>,
#> #   politics2003 <dbl>, texas1998 <dbl>, uga2015 <dbl>,
#> #   usfullsurveyor2015 <dbl>, usmturk2015 <dbl>, usstudent2015 <dbl>

# settings only
term_table %>% 
  dplyr::filter(component == "setting")
#> # A tibble: 503 × 26
#>    term           component china1999 dukecommunity20… dukestudent2015 egypt2015
#>    <chr>          <chr>         <dbl>            <dbl>           <dbl>     <dbl>
#>  1 acrobatics     setting           1                0               0         0
#>  2 adult_booksto… setting           1                0               0         0
#>  3 adult_educati… setting           1                0               0         0
#>  4 airplane       setting           1                0               0         0
#>  5 airport        setting           1                0               0         0
#>  6 altar          setting           1                0               0         0
#>  7 ambulance      setting           1                0               0         0
#>  8 amusement_park setting           1                0               0         0
#>  9 apartment      setting           1                0               0         0
#> 10 art_gallery    setting           1                0               0         0
#> # … with 493 more rows, and 20 more variables: expressive2002 <dbl>,
#> #   gaymensanfrancisco1980 <dbl>, germany1989 <dbl>, germany2007 <dbl>,
#> #   household1994 <dbl>, indiana2003 <dbl>,
#> #   internationaldomesticrelations1981 <dbl>, internet1998 <dbl>,
#> #   japan1995 <dbl>, morocco2015 <dbl>, nc1978 <dbl>, nireland1977 <dbl>,
#> #   ontario1980 <dbl>, ontario2001 <dbl>, politics2003 <dbl>, texas1998 <dbl>,
#> #   uga2015 <dbl>, usfullsurveyor2015 <dbl>, usmturk2015 <dbl>, …

# limit to only the two Germany dictionaries and exclude terms in neither
term_table %>% 
  dplyr::select(term, component, germany1989, germany2007) %>% 
  dplyr::filter(germany1989 + germany2007 >= 1)
#> # A tibble: 1,658 × 4
#>    term          component germany1989 germany2007
#>    <chr>         <chr>           <dbl>       <dbl>
#>  1 abandon       behavior            0           1
#>  2 absent_minded modifier            0           1
#>  3 abuse         behavior            0           1
#>  4 academic      identity            1           1
#>  5 accountant    identity            1           0
#>  6 accuse        behavior            0           1
#>  7 accuser       identity            1           0
#>  8 acquaintance  identity            1           1
#>  9 active        modifier            0           1
#> 10 admire        behavior            0           1
#> # … with 1,648 more rows

# limit to terms that contain "friend"
term_table %>% 
  dplyr::filter(stringr::str_detect(term, "friend"))
#> # A tibble: 14 × 26
#>    term           component china1999 dukecommunity20… dukestudent2015 egypt2015
#>    <chr>          <chr>         <dbl>            <dbl>           <dbl>     <dbl>
#>  1 befriend       behavior          1                1               1         0
#>  2 boyfriend      identity          1                1               1         0
#>  3 friendly       modifier          1                1               1         1
#>  4 girlfriend     identity          1                1               1         0
#>  5 best_friend    identity          0                1               1         1
#>  6 ex_boyfriend   identity          0                1               1         1
#>  7 ex_girlfriend  identity          0                1               1         0
#>  8 friend         identity          0                1               1         1
#>  9 unfriend       behavior          0                1               1         0
#> 10 unfriendly     modifier          0                1               1         1
#> 11 conducting_or… behavior          0                0               0         0
#> 12 reaffirming_f… behavior          0                0               0         0
#> 13 childhood_fri… identity          0                0               0         0
#> 14 old_friend     identity          0                0               0         0
#> # … with 20 more variables: expressive2002 <dbl>, gaymensanfrancisco1980 <dbl>,
#> #   germany1989 <dbl>, germany2007 <dbl>, household1994 <dbl>,
#> #   indiana2003 <dbl>, internationaldomesticrelations1981 <dbl>,
#> #   internet1998 <dbl>, japan1995 <dbl>, morocco2015 <dbl>, nc1978 <dbl>,
#> #   nireland1977 <dbl>, ontario1980 <dbl>, ontario2001 <dbl>,
#> #   politics2003 <dbl>, texas1998 <dbl>, uga2015 <dbl>,
#> #   usfullsurveyor2015 <dbl>, usmturk2015 <dbl>, usstudent2015 <dbl>
```

### Standardization and other processing of raw dictionary data

To facilitate comparisons between dictionaries, the terms in all have
been transformed into a common format. All terms are provided in
all-lowercase and spelling and spacing have been made standard across
dictionaries (generally, the US spellings are chosen). Spaces are
represented by underscores in all dictionaries. Accents and other
punctuation have been removed. For transparency, the code used to
perform this standardization is included in `R/raw_data_processing.R`.

Where individual data is available, the mean, standard deviation, and
covariance values that are reported in the summary data have been
calculated directly from the individual data within this package. The
script used for this is in `data-raw/dicts.R`, which calls functions
included in `R/raw_data_processing.R`

## Equations

The second kind of data this package makes available are tables
containing estimates of affect control theory equation coefficients.
These coefficients can be used in conjunction with dictionaries to
calculate affective responses to various situations. See section 18.2 of
David Heise’s *Expressive Order* (2007) for a detailed description of
the structure and use of these tables.

To see information on all equation sets available in this package, call
`eqn_info()`. All of the available equation sets were originally sourced
from Interact (version 2.1 beta, accessed May 2021), and component
titles are based on labels applied in Interact.

### Naming convention

Because equations contain varying numbers of coefficients, they are
stored in the package as separate data frames rather than combined into
one as the dictionaries are. The equation datasets are named according
to the following convention:

`[key]\_[component]\_[gender]\_eqn`

-   *Key* is a unique identifier for the study in which the equation
    coefficients were estimated. Some of these overlap with dictionary
    keys, but not all. All keys can be accessed using `eqn_info()`.
-   *Component* indicates the type of equations represented. The
    following components are possible (more information on each is
    available in section 18.2 of David Heise’s *Expressive Order*
    (2007)).
    -   *impressionabo:* Impression change equations including actor,
        behavior, and object terms
    -   *impressionabos:* Impression change equations including actor,
        behavior, object, and setting terms
    -   *selfdir:* Equations for self-directed action, including actor
        and behavior terms.
    -   *traitid:* Equations for combining a trait modifier with an
        identity. In some datasets, this set is the same as the
        emotionid set.
    -   *emotionid:* Equations for combining an emotion modifier with an
        identity. In some datasets, this set is the same as the traitid
        set.
-   *Gender* indicates the gender of study participants whose ratings
    are used to estimate the equation coefficients. Options are `m`,
    `f`, and `av`. Call `eqn_info()` (optionally, with a specific
    equation key as an argument) to check which components are specified
    for which genders. Unlike with dictionary files, where all
    components within a dictionary are available for the same set of
    genders, the available genders for equation sets vary by component.
    Interact, from which all of these equation sets were originally
    taken, provides male and female-labeled sets for each equation.
    However, sometimes these sets are identical. In this case, this
    package simply labels the component of the set as `av` rather than
    including it twice. All values are provided exactly as they are in
    Interact–no post-hoc calculations have been performed.

``` r
eqn_info("us2010")
#> Equation set name: us2010
#> Component genders: impressionabo_av, impressionabos_f, impressionabos_m, selfdir_f, selfdir_m, traitid_av, emotionid_f, emotionid_m
```

## Writing files for Interact

Interact allows users to import their own dictionary and equation files.
Though many of the dictionaries and equation sets provided here are
available in Interact, several are not. Additionally, sometimes it is
useful to use subsets of dictionaries (e.g. when a user wants to
restrict the identities, behaviors, or modifiers available), and
creating these subsets within Interact itself, while possible, is
tedious and not easily replicable.

The `save_for_interact()` function in this package makes it easy to
write dictionary and equation .txt files that are correctly formatted
for copying and pasting into Interact. The `data` argument should be a
dataframe that the user wishes to save (it can be one of those provided,
or one created by the user). `type` should be either `dict` or `eqn` (by
default, it is set to `dict`). `filename` should be the filepath at
which the user wishes to save the file (by default, it saves to the
working directory under the name of the dataset). All filepaths must end
in .txt.

Note that at this time, Interact does not accept institution codes, and
so these will be removed from dictionary files before saving.
