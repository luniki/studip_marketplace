module Paperclip
  class ManifestProcessor < Paperclip::Processor
    def initialize file, options = {}, attachment = nil
      super
      @current_format = File.extname(@file.path)
      @basename = File.basename(@file.path, @current_format)
    end

    def make
      dst = Tempfile.new([@basename, "manifest"].compact.join("."))

      manifest = extract_manifest @file.path
      dst << manifest

      @attachment.instance.manifest = Manifest.new manifest

      dst
      rescue Exception => e
        raise PaperclipError, "There was an error processing the manifest for #{@basename} #{e}"
    end

    def extract_manifest(path)
      z = Zip::ZipFile.open path
      z.read("plugin.manifest")
    end
  end
end

