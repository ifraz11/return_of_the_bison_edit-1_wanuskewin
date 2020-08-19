class CueServer < AVDevice 
  ip_address '10.10.224.152'
  port 80
  #port 52737
  protocol "HTTP"
  

  def commands
    {
      mystery_loop: "m100",
      spectrum_1: "m101",
      spectrum_2: "m102",
      spectrum_3: "m103",
      spectrum_4: "m104",
      spectrum_5: "m105",
      orion: "m111",
      aurora: "m112",
      rigel: "m113",
      helix_nebula: "m114",
      sun: "m115",
      calcium: "m121",
      carbon: "m122",
      helium: "m123",
      oxygen: "m124",
      sodium: "m125",
      hydrogen: "m126"
    }
  end
  
end
