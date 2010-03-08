module Paperclip
  class ManifestProcessor < Paperclip::Processor
    def initialize file, options = {}, attachment = nil
      super
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
    end

    def make
      dst = Tempfile.new([@basename, "manifest"].compact.join("."))

      manifest = Zip::ZipFile.open(@file.path){|z| z.read("plugin.manifest")}
      dst << manifest

      @attachment.instance.manifest = Manifest.new manifest

      dst
      rescue Exception => e
        raise PaperclipError, "There was an error processing the manifest for #{@basename} #{e}"
    end
  end
end

