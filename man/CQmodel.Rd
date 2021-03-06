\name{CQmodel}
\alias{CQmodel}
\alias{print.CQmodel}
\alias{print.SOE}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ConQuest Output Processing}
\description{The CQmodel function reads ConQuest item parameter and person parameter output files and converts them into a list of data frames for more convenient data processing.}
\usage{
CQmodel(p.est = NULL, show = NULL, p.type = NULL, equation = NULL)
\method{print}{CQmodel}(x,\dots)
\method{print}{SOE}(x,\dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{p.est}{ Conquest person parameters file (EAPs, MLEs, etc.). }
  \item{show}{ ConQuest show file. }
  \item{p.type}{ Type of person parameter estimate (EAP, MLE or WLE). If not specified, will try to determine from the extension of the p.est file. }
  \item{equation}{ String giving the model equation, if the Summary of Estimation table was not included in the show file.}
  \item{x}{ Object that determines which function to call. }
  \item{...}{Additional arguments.}
}

\value{
CQmodel returns an object of type CQmodel. Usually contains:
Tables:
\item{RMP}{ A list of data frames containing the response model parameter estimates. One data frame is created for each table in the output. Each data frame contains parameter estimates, errors, and fit information.}
\item{GIN}{ A matrix containing the item thresholds (if included in the ConQuest output). The rows are items and the columns are steps.}
\item{p.est}{ A data frame containing the person parameter estimates }


Summary of estimation:
\item{SOE}{A list of various parameters related to the estimation}
Items that may be in the SOE list include:
\item{method}{ Estimation method }
\item{distribution}{ Assumed population distribution }
\item{constraint}{ Constraint}
\item{format}{ Specified format of the datafile }
\item{equation}{ A character string containing the item model (e.g. "item+item*step") }
\item{participants}{ Sample size }
\item{deviance}{ Final deviance of the model }
\item{parameters}{ Total number of estimated parameters }
\item{iterations}{ Number of iterations }
\item{seed}{ Random number generation seed }
\item{PV.nodes}{ Number of nodes used when drawing PVs }
\item{fit.nodes}{ Number of nodes used when computing fit }
\item{n.plausible.values}{ Number of plausible values drawn }
\item{max.iterations.no.improvement}{ Maximum number of iterations without a deviance improvement }
\item{max.steps}{ Maximum number of Newton steps in M-step }
\item{zero.perfect.value}{ Value for obtaining finite MLEs for zero/perfects }
\item{termination.reason}{ Reason for iteration termination }
\item{max.iterations}{}
\item{parameter.change}{}
\item{deviance.change}{}

Run details:
\item{run.details}{ A list of details of the run }
Items that may be included in the run.details list include:
\item{date}{ The date of the ConQuest run }
\item{data.file}{ The name of the datafile used }
\item{format}{ The specified format of the datafile }
\item{names}{ Names of items and/or dimensions }




Additional items:
\item{deviance}{ The deviance of the model }
\item{equation}{ A character string containing the model specification (e.g. "item+item*step") }
\item{participants}{ The number of participants }
\item{parameters}{ The number of parameters }
\item{title}{ The run title }
\item{reg.coef}{ Regression coefficients }
\item{rel.coef}{ Reliability coefficients }
\item{variances}{}
\item{nDim}{ Number of dimensions }
\item{dimensions}{ Dimension names }
\item{p.est.type}{}
}

\author{Rebecca Freund and David Torres Irribarra}


\examples{
	
fpath <- system.file("extdata", package="WrightMap")

# Partial credit model
model1 <- CQmodel(p.est = file.path(fpath,"ex2.eap"), 
show = file.path(fpath,"ex2.shw")) 
model1 #Shows what tables are available

model1$SOE #Summary of estimation
model1$equation # Model specification
model1$reg.coef # Regression coefficients
model1$rel.coef # Reliability coefficients
model1$variances # Variances

names(model1$RMP) # Names of parameter tables
head(model1$RMP$item) #Item parameters
head(model1$RMP$"item*step") #Item by step parameters

# Complex model
model2 <- CQmodel(file.path(fpath,"ex4a.mle"), 
file.path(fpath,"ex4a.shw")) 
model2$equation # Model specification
names(model2$RMP) # Names of parameter tables
head(model2$RMP$"rater*topic*criteria*step") #An interaction table

model1$GIN #Item thresholds
model2$GIN #Item thresholds

head(model1$p.est)  ##EAPs
head(model2$p.est)  ##MLEs

}