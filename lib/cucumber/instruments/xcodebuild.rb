class Xcodebuild

  def initialize(xcodebuildconfig)
    @xcodebuildconfig = xcodebuildconfig
  end

  def app_bundle_path
    settings = build_settings
    "#{settings["CONFIGURATION_BUILD_DIR"]}/#{settings["EXECUTABLE_FOLDER_PATH"]}"
  end

  def build_settings
    output = `xcodebuild -project #{@xcodebuildconfig.xcodeproj} \
                              -configuration #{@xcodebuildconfig.configuration} \
                              -scheme #{@xcodebuildconfig.scheme} \
                              -sdk #{@xcodebuildconfig.sdk} \
                              -showBuildSettings`
    settings = {}
    output.scan(/^\s{4}(\w+)\ =\ ?(.+$)?/) { |m| settings[m[0]]=m[1] }
    settings
  end
end