module Paperclip
  class ManifestProcessor < Paperclip::Processor
    def initialize file, options = {}, attachment = nil
      super
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
    end

    def make
      dst = Tempfile.new([@basename, "manifest"].compact.join("."))

      manifest_string = Zip::ZipFile.open(@file.path){|z| z.read("plugin.manifest")}
      dst << manifest_string

      manifest = Manifest.new manifest_string
      @attachment.instance.manifest = manifest
      @attachment.instance.version = manifest.version
      @attachment.instance.studipMinVersion = manifest.studipMinVersion
      @attachment.instance.studipMaxVersion = manifest.studipMaxVersion

      dst
      rescue Exception => e
        raise PaperclipError, "The zip file is not a valid plugin release package (#{e})"
    end
  end
end

