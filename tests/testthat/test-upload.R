context("upload")

server <- "immport-upload.niaid.nih.gov:8443"
upload_ticket <- "jkim2345_20171213_15861"
validation_ticket <- "jkim2345_20171213_15860"

test_that("`generate_templates` works", {
  skip_if_offline(server)

  output_file <- generate_templates(5851, output_dir = tempdir())

  expect_true(file.exists(output_file))
  expect_gt(file.info(output_file)$size, 0)

  expect_error(generate_templates(9999))
  expect_error(generate_templates(5851, output_dir = "/Invalid/Dir"))
})

test_that("`list_workspaces` works", {
  skip_if_offline(server)

  res <- list_workspaces()

  expect_is(res, "list")
  expect_equal(names(res[[1]]),
               c("workspaceId", "name", "type",
                 "category", "dateCreated",
                 "dateLastUpdated", "createdBy",
                 "lastUpdatedBy"))
})

test_that("`check_status` works", {
  skip_if_offline(server)

  res <- check_status(upload_ticket)

  expect_equal(res, "Completed")

  expect_error(check_status("invalid_19991231_99999"))
})

test_that("`get_ticket_summary` works", {
  skip_if_offline(server)

  res <- get_ticket_summary(upload_ticket)

  expect_is(res, "list")
  expect_equal(names(res), c("uploadRegistrationId", "workspaceName",
                             "fileName", "status", "uploadTicketNumber",
                             "dateCreated", "createdBy", "uploadMethod",
                             "uploadRegistrationResults"))

  expect_error(get_ticket_summary("invalid_19991231_99999"))
})

test_that("`download_ticket_report` works", {
  skip_if_offline(server)

  res <- download_ticket_report(upload_ticket, output_dir = tempdir())

  expect_true(file.exists(res))
  expect_gt(file.size(res), 0)

  expect_error(download_ticket_report("invalid_19991231_99999"))
})
