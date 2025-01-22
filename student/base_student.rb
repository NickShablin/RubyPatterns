class BaseStudent
  attr_reader :id, :git

  def initialize(id:, git: nil)
    self.id = id
    self.git = git if !git.nil?
  end

  # Validators for setters
  def self.validate_git(git)
    git.match?(/\Ahttps:\/\/github\.com\/[-a-zA-Z0-9@:%_\+.~#=]+\/[-a-zA-Z0-9._~%]+\.git\z/)
  end  

  def self.valid_id(id)
    id.match?(/^\d+$/)
  end

  # Setters
  def id=(id)
    if BaseStudent.valid_id(id)
      @id = id
    else
      raise ArgumentError, "Неправильно введен id"
    end
  end
  
  def validate?
    has_contact?() && has_git?()
  end
  
  def has_contact?
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def has_git?
    !@git.nil? && !@git.empty?
  end

  protected # кастуем щиты от чужих
  def git=(git)
    if BaseStudent.validate_git(git)
      @git = git
    else
      raise ArgumentError, "Неправильно введен git"
    end
  end
end