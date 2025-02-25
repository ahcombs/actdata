% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subset.R
\name{create_instcode}
\alias{create_instcode}
\title{Create institution code strings from logicals indicating category membership}
\usage{
create_instcode(
  component,
  male = F,
  female = F,
  overt = F,
  surmised = F,
  place = F,
  time = F,
  lay = F,
  business = F,
  law = F,
  politics = F,
  academe = F,
  medicine = F,
  religion = F,
  family = F,
  sexual = F,
  monadic = F,
  group = F,
  corporal = F,
  adjective = F,
  adverb = F,
  emotion = F,
  trait = F,
  status = F,
  feature = F,
  emotion_spiral = F
)
}
\arguments{
\item{component}{whether the term is an identity, behavior, component, or setting}

\item{male, female}{logical. What genders terms can typically be applied to (identities only)}

\item{overt, surmised}{logical. Whether labeling behaviors requires interpretation or insight
on the part of the observer (behaviors only).}

\item{place, time}{logical. Type of setting (settings only).}

\item{lay, business, law, politics, academe, medicine, religion, family, sexual}{logical. Societal
institutions that terms may belong to. Institutions, behaviors, and settings only.}

\item{monadic, group, corporal}{logical. How a term requires or implicates others. Identities,
behaviors, and settings only.}

\item{adjective, adverb}{logical. Part of speech for modifiers.}

\item{emotion, trait, status, feature, emotion_spiral}{logical. Categories for modifiers.}
}
\value{
character string institution code
}
\description{
This function returns institution codes in a string format that is properly formatted
for import to Interact and consistent with typical ACT data practices. Relevant
arguments depend on the component. All function parameters are logical, and all defaults
are FALSE, meaning that to create an institution code, users need only set the categories
that apply to TRUE. Arguments that do not apply to the given component will be ignored.
See Heise's 2014 PDF manual for Interact or Heise's 2007 book \emph{Expressive Order} for
more details on these categories.
}
\details{
\itemize{
\item Identities: male, female, lay, business, law, politics, academe, medicine,
religion, family, sexual, monadic, group, corporal
\item Behaviors: overt, surmised, lay, business, law, politics, academe, medicine,
religion, family, sexual, monadic, group, corporal
\item Modifiers: adjective, adverb, emotion, trait, status, feature, emotion_spiral
\item Settings: place, time, lay, business, law, politics, academe, medicine,
religion, family, sexual, monadic, group, corporal
}
}
\examples{
create_instcode(component = "identity", male = TRUE, female = TRUE, lay = TRUE)
create_instcode(component = "behavior", overt = TRUE, business = TRUE, group = TRUE)
create_instcode(component = "modifier", adjective = TRUE, emotion = TRUE)
}
