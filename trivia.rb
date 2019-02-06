
# Podría implementar herencias, generar codigo mas compacto?
# ¿ Si hago un ciclo ( while), en el metodo preguntas sería mas largo o corto?

class Trivia

  def initialize
    @array =[]
    mostrar_archivo("preguntas.txt")
  end

  def cargar_archivo(file)
    if File.file?(file)
      arreglo = IO.readlines(file)
      arreglo.each do |hash|
        pregunta, respuesta = hash.chomp.split('/')
        hash = {pregunta: pregunta, respuesta: respuesta }
        @array << hash
      end
    else
      puts "Error en el Sistema"
    end
  end

  def mostrar_archivo(file)
    file = cargar_archivo(file)
    return file
  end

  def menu
    puts "Juguemos  ( ͡° ͜ʖ ͡°) "
    puts "Retador ¿Cual es tu nombre?   ( ͡ಠ ʖ̯ ͡ಠ)"
    jugador = gets.chomp
    puts "#{jugador} Bienvenido ↑_(ΦwΦ;)Ψ "
    puts "Deseas escapar, escribe gallina "
    puts  "Si quieres jugar escribre Retador "
    inicio = gets.chomp
    if inicio.downcase == "gallina"
      puts " #{jugador}!  Σ(￣ロ￣lll) Uhhhhhhhh"
      exit
    elsif inicio.downcase == "retador"
      puts "Buajajajajajajajajajaj ミ●﹏☉ミ Aquí empieza"
    else
      puts "#{jugador} , tienes miedo ⊙﹏⊙ , de vuelta al inicio"
      puts
      menu()
    end
  end

  def preguntas
    if @array == [] || @array == nil || @array == ""
      puts "Me has derrotado ヽ(´Д`;)ﾉ"
      exit
    else
      @array.shuffle!
      puts @array[0][:pregunta]
      while @array != ""
        print "> "
        respuestas = gets.chomp
        if respuestas.downcase == @array[0][:respuesta]
          # si pongo un contador , y cada vez que tenga una respuesta correcta cambio el mensaje?
          # debo definir una variable , para esto?
          puts "Lo tuyo es suerte"
          @array.shift
          preguntas
        elsif respuestas.downcase == "gallina"
          puts "Sabia que no tenias lo necesario!!!!!"
          exit
        else
          puts "Esa no es la respuesta"
          puts @array[0][:pregunta]
        end
      end
    end
  end

end


inicio = Trivia.new
inicio.menu
inicio.preguntas
