# frozen_string_literal: true

Release::Notes.configure do |config|
  config.output_file = './RELEASE_NOTES.md'
  config.temp_file = './release-notes.tmp.md'
  config.include_merges = false
  config.ignore_case = true
  config.log_format = '- %s'
  config.extended_regex = true
  config.bug_labels = %w[;B Bug Error]
  config.feature_labels = %w[;F ;E Add Create]
  config.misc_labels = %w[;M Refactor]
  config.bug_title = '**Fixed bugs:**'
  config.feature_title = '**Implemented enhancements:**'
  config.misc_title = '**Miscellaneous:**'
  config.link_to_labels = ['RND #', 'AB #', 'BC #']
  config.link_to_humanize = %w[ReleaseNotesDemo LabelAB LabelBC]
  config.link_to_sites = %w[https:\/\/release-notes-demo\/projects https:\/\/label-ab\/projects https:\/\/label-bc\/projects]
  config.timezone = 'America/New_York'
end
