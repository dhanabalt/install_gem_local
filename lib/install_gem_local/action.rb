module InstallGemLocal
  class Action
    class << self
      def remove_gem
        `rm install_gem_local-0.1.1.gem`
      end

      def build_gem
        `gem build install_gem_local.gemspec`
      end

      def install_gem
        `gem install install_gem_local-0.1.1.gem`
      end

      def aoa
        remove_gem
        build_gem
        install_gem
      end
    end
  end
end