% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/upload.R
\name{generate_templates}
\alias{generate_templates}
\title{Generate Documentation Templates}
\usage{
generate_templates(workspace_id, output_dir = ".")
}
\arguments{
\item{workspace_id}{An integer. ID specific to a workspace.}

\item{output_dir}{A character. Output directory.}
}
\value{
A character.
}
\description{
Generate Documentation Templates
}
\examples{
\dontrun{
generate_templates(workspace_id = 999999)
}

}
\references{
\url{http://docs.immport.org/#API/DataUploadAPI/datauploadapi/#documentation-generation-request-with-authentication}
}
\seealso{
\code{\link{list_workspaces}}
}
