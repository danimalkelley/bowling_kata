class Scorer

  def initialize

  end


  def to_frames(scores)
    l_scores = scores.dup
    frames = []
    while l_scores.length > 0
      if l_scores.first == 'X'
        frames << [l_scores.shift]
      else
        frames << l_scores.shift(2)
      end
    end
    frames
  end

  def frames_raw(scores)
    frames = to_frames(scores)
    raw_frames = frames.map do |e|
      if e.include?('X')
        [10]
      elsif e[1] == '/'
        [e[0].to_i,10-e[0].to_i]
      else
        [e[0].to_i,e[1].to_i]
      end
    end
    raw_frames
  end

  def score(scores)
    raw_frames = frames_raw(scores)
    frames = to_frames(scores)
    output = 0
    frames.each_with_index do |frame,i|
      if i < 10
        if frame.include?('X')
          if raw_frames[i+1][0] == 10
            output += 10 + raw_frames[i+1][0] + raw_frames[i+2][0]
          else
            output += 10 + raw_frames[i+1][0] + raw_frames[i+1][1]
          end
        elsif frame.include?('/')
          output += 10 + raw_frames[i+1][0]
        else
          output += frame[0].to_i + frame[1].to_i
        end
      end
    end
    output
  end
end

