class Michelle

    @@leg = 2

    def initialize(hair_color, fav_color)
        @hair_color = hair_color
        @fav_color = fav_color
    end

    def get_hair_color
        @hair_color
    end

    def get_fav_color
        @fav_color
    end

    def get_leg
        @@leg
    end
    
    def self.upgrade
        @@leg = 4
    end

    def pink_cap
        if @fav_color == @hair_color
            return @hair_color.upcase
        end
    end

    def congrad
        pink_cap + "!, Good Choice"
    end

    def self.compare_hair(*michelles)
        michelles.each do |michelle|
            if michelle.get_hair_color == "pink" || michelle.get_hair_color == "PINK"
                return michelle.get_hair_color
            else
                return "worng hair color"
            end
        end
    end

end

michelle_1 = Michelle.new("pink" , "pink")
michelle_2 = Michelle.new("blue" , "pink")
michelle_3 = Michelle.new("yellow","pink")

p michelle_1
p michelle_2

p michelle_2.get_hair_color
p michelle_2.get_leg

Michelle.upgrade

p michelle_2.get_leg

p michelle_1.get_hair_color
p michelle_1.pink_cap
p michelle_1.congrad

p Michelle.compare_hair(michelle_2,michelle_3)