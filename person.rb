class Person
    attr_reader :id
    attr_accessor :name, :age
    def initialize(name = "Unknown", age, parent_permission: true)
        @id = Random.rand(1..1000)
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def of_age?
        return true if @age >= 18
        return false
    end

    def can_use_services?
        return true if of_age? || @parent_permission
    end

    private :of_age?

end

person = Person.new(25)
puts person.instance_eval('of_age?')
puts person.can_use_services?
