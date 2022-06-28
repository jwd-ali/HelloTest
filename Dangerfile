# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
# declared_trivial = github.pr_title.include? "#trivial"

# PR is a work in progress and shouldn't be merged yet
warn "PR is classed as Work in Progress" if github.pr_title.include? "[WIP]"


# This is swiftlint plugin. More info: https://github.com/ashfurrow/danger-swiftlint
#
# This lints all Swift files and leave comments in PR if
# there is any issue with linting
swiftlint.lint_files inline_mode: true
swiftlint.lint_files fail_on_error: true
swiftlint.lint_all_files = true

# Don't let testing shortcuts get into master by accident
# these checks are related to Quick unit testing framework
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1

# Future rules

# has_app_changes = !git.modified_files.grep(/ProjectName/).empty?
# has_test_changes = !git.modified_files.grep(/ProjectNameTests/).empty?
#
# # If changes are more than 10 lines of code, tests need to be updated too
# if has_app_changes && !has_test_changes && git.lines_of_code > 10
#   fail("Tests were not updated", sticky: false)
# end
