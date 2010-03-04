class ManifestParseException < Exception; end

class Manifest

  @@keys = %w(pluginclassname pluginname origin version studipMinVersion studipMaxVersion)
  attr_reader *@@keys
  attr_reader :additionalclasses

  def initialize(string = nil)
    @additionalclasses = []
    parse_manifest string if string
  end

  def parse_manifest(string)
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

  def validate(errors)
#    validate_classname errors
#    validate_version errors, :version, :studipMaxVersion, :studipMinVersion
  end

protected
  def validate_classname errors
    errors.add
  end

  def validate_version errors, *fields
  end
end
