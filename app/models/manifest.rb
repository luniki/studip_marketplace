class ManifestParseException < Exception; end

class Manifest

  @@keys = %w(pluginclassname pluginname origin version studipMinVersion studipMaxVersion)
  attr_accessor *@@keys
  attr_accessor :additionalclasses

  def initialize(manifest = nil)
    @additionalclasses = []

    return if manifest.blank?

    if manifest.is_a? Hash
      manifest.each do |k, v|
        instance_variable_set("@#{k}", v.strip) if @@keys.include? k.to_s
      end
    else
      parse_manifest_string manifest.to_s
    end
  end

  def parse_manifest_string(string)
    string.each_line do |line|
      unless line =~ /^(#.*|\s*)$/
        k, v = line.split "="
        k.strip!
        v.strip!

        unless @@keys.include? k then
          raise ManifestParseException.new "Unknown key #{k}"
        end

        if k == "pluginclassname" && instance_variable_get("@#{k}") then
          @additionalclasses << v
        else
          instance_variable_set "@#{k}", v
        end
      end
    end
  end

  def to_s
    string = @@keys.inject("") do |memo, key|
      (value = send key) ? memo + "#{key}=#{value}\n" : memo
    end
    additionalclasses.each do |klass|
      string << "pluginclassname=#{klass}"
    end
    string
  end

  def to_zip
    Zip::ZipFile.open(random_filename, Zip::ZipFile::CREATE) do |zip|
      zip.get_output_stream("plugin.manifest") do |f|
        f.puts self
      end
      zip
    end
  end

  private

  def random_filename
    require "tempfile" unless Tempfile
    tmp = Tempfile.new "zip"
    file = tmp.path
    tmp.unlink
    file
  end
end
