# frozen_string_literal: true

module InstallGemLocal
  class Utilization
    class << self
      def show_methods
        long_desc = <<~STR
          *******************************************

          CLI to manage your own gems

          *******************************************
          Available Methods
          *******************************************

          Remove old Gem version

          Build new Gem version

          Install new Gem version

          Copy gem to folder

          Build the latest version and push the gem

          Remove old version, build and install the new version

          Remove old version, build, install and copy the new version

          *******************************************
        STR
      end
    end
  end
end
