# frozen_string_literal: true

module InstallGemLocal
  module BuildGem
    def build_gem
      puts '-----------------------------'
      puts ''
      file = tty_command.run('find -type f -name "*.gemspec"')
      ap file_name = file.out.strip
      file_name.empty? ? ap('Gemspec not found') : tty_command.run("gem build #{file_name}")
    end
  end
end
