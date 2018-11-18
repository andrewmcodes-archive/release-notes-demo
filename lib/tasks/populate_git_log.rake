namespace :populate_git_log do
  task run: :environment do
    # make sure git is installed
    if /git version/.match(`git --version`)
      # make sure you are in a git repo
      if `git rev-parse --is-inside-work-tree`.strip == "true"
        Release::Notes.configure { Release::Notes.configuration } unless Release::Notes.configuration
        10.times do |x|
          5.times do |y|
            # store all configured labels in all_labels:Array
            all_labels = []
            Release::Notes.configure do |config|
              all_labels << config.bug_labels
              all_labels << config.feature_labels
              all_labels << config.misc_labels
            end
            # Choose a random element from `link_to_labels`
            rand_link = Release::Notes.configuration.link_to_labels.sample
            # Choose a random element from all_lables
            rand_label = all_labels.flatten.sample
            # Commit with message
            `git add . && git commit --allow-empty -m "[#{rand_link + y.to_s}] test commit #{(x*y).to_s} #{rand_label}"`
          end
          # Add tag
          `git tag -f v#{x} -m "Version #{x} release"`
        end
        # Remove file if it exists - better for testing
        FileUtils.remove_file("RELEASE_NOTES.md") if File.file?("RELEASE_NOTES.md")
        # Generate new release notes
        `bin/rails update_release_notes:run`
      else
        `git init`
      end
    end
  end
end
