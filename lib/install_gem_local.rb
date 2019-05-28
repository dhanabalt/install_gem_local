# frozen_string_literal: true

%w[thor downup awesome_print tty-command pry].each { |f| require f }

# TODO: refactor these code later
Dir[File.join(File.expand_path(__dir__), 'install_gem_local', 'action/*.rb')].each { |f| require f }
Dir[File.join(File.expand_path(__dir__), 'install_gem_local', '**/*.rb')].each { |f| require f }

module InstallGemLocal
  class App < Thor
    desc 'methods_description', 'list all methods description'
    def methods_desc
      puts InstallGemLocal::Utilization.show_methods
    end
  end
end
