module CharacterData
  class Image
    attr_reader :realpath

    def initialize(realpath:)
      @realpath = realpath
    end

    def filename
      @filename ||= realpath.split('/')[-1]
    end

    def file
      @file ||= File.open(realpath)
    end

    def path
      @path ||= @realpath.split('/')[-5..-1].join('/')
    end
  end
end
