module CharacterData
  class Image
    attr_reader :realpath

    def initialize(realpath:)
      @realpath = realpath
    end

    def filename
      @filename ||= realpath.split('/')[-1]
    end

    def io
      @io ||= File.open(realpath)
    end
  end
end
