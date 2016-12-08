local function run(msg,matches)
   local news = "http://www.imagegenerator.net/newscaster/image.php?headline=BREAKING+NEWS&text="..URL.escape(matches[1])
   local einstein = "http://www.hetemeel.com/einsteinshow.php?text=++++++++++++++++++%0D%0A%0D%0A++"..URL.escape(matches[2])
   local darth = "http://www.addletters.com/pictures/star-wars-i-am-your-father-caption-generator/star-wars-i-am-your-father-caption-generator.php?caption="..URL.escape(matches[2])
   local conf = "http://pictureimage.whak.com/signs/confucius/default.aspx?pic=confucius2&text="..URL.escape(matches[2]).."&color=black&fontsize=22&move2=&move=&font=bonzai&allow=366500"
   local jes = "http://pictureimage.whak.com/signs/sign-generator/simple.aspx?color=black&color2=&watermark=&gradient=&spacing=&x=169&y=137&w=148&h=110&move=0&move2=&rotate=18&fontsize=16&text="..URL.escape(matches[2]).."&font=Verdana&allow=6128&pic=jesus-christ&align=Center&align2=Middle&transparency=255"
   local bart = "http://www.addletters.com/pictures/bart-simpson-generator/bart-simpson-generator.php?line="..URL.escape(matches[2])
   local ledfreeway = "http://www.addletters.com/pictures/electronic-freeway-sign-generator/electronic-freeway-sign-generator.php?sign="..URL.escape(matches[2])
  local  ledsimp = "http://www.addletters.com/pictures/the-simpsons-title-screen-generator/the-simpsons-title-screen-generator.php?caption="..URL.escape(matches[2])
   local dr = "http://www.addletters.com/pictures/brain-age-doctor-ryuta-kawashima-image-generator/brain-age-doctor-ryuta-kawashima-image-generator.php?face=calm&caption="..URL.escape(matches[2])
   local nwp = "http://www.addletters.com/pictures/newspaper-generator/newspaper-generator.php?section=NEWS&headline="..URL.escape(matches[2])
  local  homer = "http://pictureimage.whak.com/signs/sign-generator/simple.aspx?color=yellow&color2=black&watermark=&gradient=&spacing=&x=187&y=34&w=219&h=258&move=0&move2=&rotate=&fontsize=20&text="..URL.escape(matches[2]).."&font=simpsons&allow=6128&pic=Speaker-Phone&align=Center&align2=Middle&transparency=255"
  local  ledbg = "http://pictureimage.whak.com/signs/sign-generator/simple.aspx?color=black&color2=&watermark=&gradient=&spacing=&x=11&y=20&w=250&h=78&move=0&move2=&rotate=&fontsize=14&text="..URL.escape(matches[2]).."&font=Comic&allow=6128&pic=bill-gates-jr&align=center&align2=Middle&transparency=255"
  local  ledwin = "http://pictureimage.whak.com/signs/parody/windows/bluescreen/default.aspx?text="..URL.escape(matches[2]).."&color=white&fontsize=12&move2=&move=&font=fixedsys&allow=366500&pic=bluescreen"
   local ledfbi = "http://pictureimage.whak.com/signs/sign-generator/simple.aspx?color=white&color2=black&watermark=&gradient=&spacing=&x=15&y=108&w=388&h=182&move=0&move2=&rotate=&fontsize=24&text="..URL.escape(matches[2]).."&font=signbold&allow=6128&pic=FBI-Warning&align=center&align2=Middle&transparency=255"
   local ledrnd = "http://pictureimage.whak.com/signs/sign-generator/simple.aspx?color=blue&color2=black&watermark=&gradient=red&spacing=&x=76&y=150&w=268&h=138&move=0&move2=&rotate=-1.4&fontsize=22&text="..URL.escape(matches[2]).."&font=Jester&allow=6128&pic=Proud-American&align=Center&align2=Middle&transparency=255"
   local ledfc = "http://pictureimage.whak.com/signs/sign-generator/simple.aspx?color=black&color2=&watermark=&gradient=&spacing=&x=131&y=204&w=145&h=118&move=0&move2=&rotate=&fontsize=16&text="..URL.escape(matches[2]).."&font=Psycho&allow=6128&pic=Fight-Club&align=center&align2=Middle&transparency=255"
   local ledmed = "http://pictureimage.whak.com/signs/sign-generator/?allow=106&text="..URL.escape(matches[2]).."&font=HandItalic&color=black&fontsize=17&move2=48&move=80&rot=-2&pic=Medical-Prescription-Drugs&height=&width=&offx=5&offy=5&spacing=35&gradient=&tag=left&bubble=&bubH=&bubW=&watermark=&background=&border=&picURL=&shade=no&shadecolor=black"
   local ledtb = "http://pictureimage.whak.com/signs/sign-generator/simple.aspx?color=dimgray&color2=gainsboro&watermark=&gradient=&spacing=&x=124&y=60&w=268&h=157&move=0&move2=&rotate=-7&fontsize=26&text="..URL.escape(matches[2]).."&font=homework&allow=6128&pic=Tony-Blair-UK&align=Center&align2=Middle&transparency=255"
   local lednok = "http://pictureimage.whak.com/signs/sign-generator/simple.aspx?color=black&color2=&watermark=&gradient=&spacing=&x=117&y=187&w=219&h=174&move=0&move2=&rotate=&fontsize=18&text="..URL.escape(matches[2]).."&font=dotmatrix&allow=6128&pic=nokia-text-messaging&align=left&align2=Middle&transparency=255"
   local ledalert = "http://pictureimage.whak.com/signs/danger/default.aspx?text="..URL.escape(matches[2]).."&color=black&fontsize=14&move2=&move=&font=stencil&allow=366500&pic=bright-caution"
  local  ledblue = "http://dummyimage.com/600x400/003dd6/ffffff&text="..URL.escape(matches[2])

    return '<a href="'..news..'">عکس خبری</a>'
    end
  return {
    patterns = {
      '^[/#!]pic (.*)$',
    },
    run = run
  }