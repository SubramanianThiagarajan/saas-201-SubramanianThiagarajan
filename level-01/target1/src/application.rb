#Application Program

def enroll_statements(d,s,r) #enroll statements
  return "You have been enrolled to #{d}\nYou have been allotted section #{s}\nYour roll number is #{r}"
end

def enroll_statements1(s,r)
  return "You have been allotted section #{s}\nYour roll number is #{r}"
end

def g_sname(nm,s,d,r) #get student details format
  return nm + " - " + d + " - Section " + s + " - " + r
end

class Department #class department
  attr_accessor :s_name,:section,:s_name_list_a,:student_name,:s_name_list_b,:s_name_list_c,:roll_a,:roll_b,:roll_c

  def initialize
    self.section = {"A"=>10,"B"=>10,"C"=>10}
    @@temp = ""
    @@sec = 0
    @@ind = 0
    @@dept_students_count = 0
    @@roll_no = 0
    @@count_a = 0
    @@count_b = 0
    @@count_c = 0
    self.s_name = []
    self.roll_a = []
    self.roll_b = []
    self.roll_c = []
    self.s_name_list_a = []
    self.s_name_list_b = []
    self.s_name_list_c = [] 
  end

  def assign_rollno(counter,sect,dept_name) #assign roll number
    if counter < 10
      return "#{dept_name}" + sect + "0" + counter.to_s
    else
      return "#{dept_name}" + sect + counter.to_s
    end
  end

  def s_name_ret #return the entire student list in a department
    s_name = s_name_list_a + s_name_list_b + s_name_list_c
    return s_name
  end
  
  def ret_c_a 
    return @@count_a
  end

  def ret_c_b
    return @@count_b
  end

  def ret_c_c
    return @@count_c
  end

  def ret_dep_stu_count #return total number of students in a department
    return @@dept_students_count
  end

  def getdetail_sname(name_stu,dept) #get details of the student
    if s_name_list_a.include?(name_stu)
      @@ind = s_name_list_a.find_index(name_stu)
      g_sname(name_stu,"A",dept,roll_a[@@ind])

    elsif s_name_list_b.include?(name_stu)
      @@ind = s_name_list_b.find_index(name_stu)
      g_sname(name_stu,"B",dept,roll_b[@@ind])

    elsif s_name_list_c.include?(name_stu)
      @@ind = s_name_list_c.find_index(name_stu)
      g_sname(name_stu,"C",dept,roll_c[@@ind])
    end
  end

  def remove_stu(nm) #remove student from the previous section 
    if s_name_list_a.include?(nm)
      @@ind = s_name_list_a.find_index(nm)
      s_name_list_a.delete_at(@@ind)
      roll_a.delete_at(-1)
      @@dept_students_count -=1
      @@count_a -=1
      section["A"] -= 1

    elsif s_name_list_b.include?(nm)
      @@ind = s_name_list_b.find_index(nm)
      s_name_list_b.delete_at(@@ind)
      roll_b.delete_at(-1)
      @@dept_students_count -=1
      @@count_b -=1
      section["B"] -= 1

    elsif s_name_list_c.include?(nm)
      @@ind = s_name_list_c.find_index(nm)
      s_name_list_c.delete_at(@@ind)
      roll_c.delete_at(-1)
      @@dept_students_count -=1
      @@count_c -=1
      section["C"] -= 1
    end
  end

  #View section
  def sect_a_view 
    for i in (0..(@@count_a - 1))
      @@temp += "\n" + s_name_list_a[i] + " - " + roll_a[i].to_s
    end
    return @@temp
  end

  def sect_b_view
    for i in (0..(@@count_b - 1))
      @@temp += "\n" + s_name_list_b[i] + " - " + roll_b[i].to_s
    end
    return @@temp
  end

  def sect_c_view
    for i in (0..(@@count_c - 1))
      @@temp += "\n" + s_name_list_c[i] + " - " + roll_c[i].to_s
    end
    return @@temp
  end

  def dept_view
    sect_a_view
    sect_b_view
    sect_c_view
  end

  #add students to a particular section
  def add_to_a(sname,dept)
    @@sec = "A"
    section["A"] -= 1
    @@count_a += 1
    @@roll_no = assign_rollno(@@count_a,@@sec,dept)
    roll_a<<@@roll_no
    @s_name_list_a<<sname
    @s_name_list_a.sort!
    @@dept_students_count +=1
    return enroll_statements1(@@sec,@@roll_no) 
  end

  def add_to_b(sname,dept)
    @@sec = "B"
    section["B"] -= 1
    @@count_b += 1
    @@roll_no = assign_rollno(@@count_b,@@sec,dept)
    roll_b<<@@roll_no
    @s_name_list_b<<sname
    @s_name_list_b.sort!
    @@dept_students_count +=1
    return enroll_statements1(@@sec,@@roll_no) 
  end

  def add_to_c(sname,dept)
    @@sec = "C"
    section["C"] -= 1
    @@count_c += 1
    @@roll_no = assign_rollno(@@count_c,@@sec,dept)
    roll_c<<@@roll_no
    @s_name_list_c<<sname
    @s_name_list_c.sort!
    @@dept_students_count +=1
    return enroll_statements1(@@sec,@@roll_no) 
  end

  def add_s(sname,dept)
    if section["A"] >= 1
      @@sec = "A"
      section["A"] -= 1
      @@count_a += 1
      @@roll_no = assign_rollno(@@count_a,@@sec,dept)
      roll_a<<@@roll_no
      @s_name_list_a<<sname
      @s_name_list_a.sort!
      @@dept_students_count +=1
    
    elsif section["B"] >= 1
      @@sec = "B"
      section["B"] -= 1
      @@count_b += 1
      @@roll_no = assign_rollno(@@count_b,@@sec,dept)
      roll_b<<@@roll_no
      @s_name_list_b<<sname
      @s_name_list_b.sort!
      @@dept_students_count +=1
    
    elsif section["C"] >= 1
      @@sec = "C"
      section["C"] -= 1
      @@count_c += 1
      @@roll_no = assign_rollno(@@count_c,@@sec,dept)
      roll_c<<@@roll_no
      @s_name_list_c<<sname
      @s_name_list_c.sort!
      @@dept_students_count +=1

    else
      return "Seats are not available in #{dept}"
    end
    return enroll_statements(dept,@@sec,@@roll_no)
  end
end

# Your application
class Application
  attr_accessor :eee,:mech,:cse,:civil

  def initialize
    self.eee = Department.new
    self.mech = Department.new
    self.cse = Department.new
    self.civil = Department.new
  end

  def enroll(student_name, student_department)
    
    case student_department
    when "EEE"
      return eee.add_s(student_name,student_department)
    when "MECH"
      return mech.add_s(student_name,student_department)
    when "CSE"
      return cse.add_s(student_name,student_department) 
    when "CIVIL"
      return civil.add_s(student_name,student_department)
    end
  end

  def change_dept(student_name, student_department)
    ## write some logic to frame the string below
    if !(mech.s_name_ret.include?(student_name) || civil.s_name_ret.include?(student_name) || cse.s_name_ret.include?(student_name) || eee.s_name_ret.include?(student_name))
      return "Error: Student name not available"
    end

    case student_department
    when "EEE"
      if eee.ret_dep_stu_count < 30
        if (mech.s_name_ret.include?(student_name))
          mech.remove_stu(student_name)
          return eee.add_s(student_name,student_department)
        elsif (civil.s_name_ret.include?(student_name))
          civil.remove_stu(student_name)
          return eee.add_s(student_name,student_department)
        elsif (cse.s_name_ret.include?(student_name))
          cse.remove_stu(student_name)
          return eee.add_s(student_name,student_department)
        end
      else
        "Error: Seats are not available in EEE"
      end

    when "MECH"
      if mech.ret_dep_stu_count < 30
        if (eee.s_name_ret.include?(student_name))
          eee.remove_stu(student_name)
          return mech.add_s(student_name,student_department)
        elsif (civil.s_name_ret.include?(student_name))
          civil.remove_stu(student_name)
          return mech.add_s(student_name,student_department)
        elsif (cse.s_name_ret.include?(student_name))
          cse.remove_stu(student_name)
          return mech.add_s(student_name,student_department)
        end
      else
        "Error: Seats are not available in MECH"
      end

    when "CSE"
      if cse.ret_dep_stu_count < 30
        if (mech.s_name_ret.include?(student_name))
          mech.remove_stu(student_name)
          return cse.add_s(student_name,student_department)
        elsif (civil.s_name_ret.include?(student_name))
          civil.remove_stu(student_name)
          return cse.add_s(student_name,student_department)
        elsif (eee.s_name_ret.include?(student_name))
          eee.remove_stu(student_name)
          return cse.add_s(student_name,student_department)
        end
      else
        "Error: Seats are not available in CSE"
      end

    when "CIVIL"
      if civil.ret_dep_stu_count < 30
        if (mech.s_name_ret.include?(student_name))
          mech.remove_stu(student_name)
          return civil.add_s(student_name,student_department)
        elsif (eee.s_name_ret.include?(student_name))
          eee.remove_stu(student_name)
          return civil.add_s(student_name,student_department)
        elsif (cse.s_name_ret.include?(student_name))
          cse.remove_stu(student_name)
          return civil.add_s(student_name,student_department)
        end
      else
        "Error: Seats are not available in CIVIL"
      end
    else
      "Error: Seats are not available in #{student_department}"
    end
  end
  
  def change_section(student_name, section)
    ## write some logic to frame the string below
    if eee.s_name_ret.include?(student_name)
      case section
      when "A"
        if eee.ret_c_a < 10
          eee.remove_stu(student_name)
          eee.add_to_a(student_name,"EEE")
        else
          "Error: Seats are not available in A section"
        end
      when "B"
        if eee.ret_c_b < 10
          eee.remove_stu(student_name)
          eee.add_to_b(student_name,"EEE")
        else
          "Error: Seats are not available in B section"
        end
      when "C"
        if eee.ret_c_c < 10
          eee.remove_stu(student_name)
          eee.add_to_c(student_name,"EEE")
        else
          "Error: Seats are not available in C section"
        end
      end

    elsif mech.s_name_ret.include?(student_name)
      case section
      when "A"
        if mech.ret_c_a < 10
          mech.remove_stu(student_name)
          mech.add_to_a(student_name,"MECH")
        else
          "Error: Seats are not available in A section"
        end
      when "B"
        if mech.ret_c_b < 10
          mech.remove_stu(student_name)
          mech.add_to_b(student_name,"MECH")
        else
          "Error: Seats are not available in B section"
        end
      when "C"
        if mech.ret_c_c < 10
          mech.remove_stu(student_name)
          mech.add_to_c(student_name,"MECH")
        else
          "Error: Seats are not available in C section"
        end
      end

    elsif cse.s_name_ret.include?(student_name)
      case section
      when "A"
        if cse.ret_c_a < 10
          cse.remove_stu(student_name)
          cse.add_to_a(student_name,"CSE")
        else
          "Error: Seats are not available in A section"
        end
      when "B"
        if cse.ret_c_b < 10
          cse.remove_stu(student_name)
          cse.add_to_b(student_name,"CSE")
        else
          "Error: Seats are not available in B section"
        end
      when "C"
        if cse.ret_c_c < 10
          cse.remove_stu(student_name)
          cse.add_to_c(student_name,"CSE")
        else
          "Error: Seats are not available in C section"
        end
      end

    elsif civil.s_name_ret.include?(student_name)
      case section
      when "A"
        if civil.ret_c_a < 10
          civil.remove_stu(student_name)
          civil.add_to_a(student_name,"CIVIL")
        else
          "Error: Seats are not available in A section"
        end
      when "B"
        if civil.ret_c_b < 10
          civil.remove_stu(student_name)
          civil.add_to_b(student_name,"CIVIL")
        else
          "Error: Seats are not available in B section"
        end
      when "C"
        if civil.ret_c_c < 10
          civil.remove_stu(student_name)
          civil.add_to_c(student_name,"CIVIL")
        else
          "Error: Seats are not available in C section"
        end
      end
    else
      "Error: Seats are not available"
    end
  end

  def department_view(student_dept)
    ## write some logic to frame the string below
    @@t = "List of students:"
    case student_dept
    when "EEE"
      @@t + eee.dept_view
    when "CSE"
      @@t + cse.dept_view
    when "CIVIL"
      @@t + civil.dept_view
    when "MECH"
      @@t + mech.dept_view
    end
  end

  def section_view(student_dept, section)
    ## write some logic to frame the string below
    @@t = "List of students:"
    case student_dept
    when "EEE"
      case section
      when "A"
        @@t + eee.sect_a_view
      when "B"
        @@t + eee.sect_b_view
      when "C"
        @@t + eee.sect_c_view
      end
    when "CSE"
      case section
      when "A"
        @@t + cse.sect_a_view
      when "B"
        @@t + cse.sect_b_view
      when "C"
        @@t + cse.sect_c_view
      end
    when "CIVIL"
      case section
      when "A"
        @@t + civil.sect_a_view
      when "B"
        @@t + civil.sect_b_view
      when "C"
        @@t + civil.sect_c_view
      end
    when "MECH"
      case section
      when "A"
        @@t + mech.sect_a_view
      when "B"
        @@t + mech.sect_b_view
      when "C"
        @@t + mech.sect_c_view
      end
    end
  end

  def student_details(student_name)
    ## write some logic to frame the string below
    if (eee.s_name_ret.include?(student_name))
      return eee.getdetail_sname(student_name,"EEE")

    elsif (mech.s_name_ret.include?(student_name))
      return mech.getdetail_sname(student_name,"MECH")

    elsif (cse.s_name_ret.include?(student_name))
      return cse.getdetail_sname(student_name,"CSE")

    elsif (civil.s_name_ret.include?(student_name))
      return civil.getdetail_sname(student_name,"CIVIL")

    else
      return "Error: Student details not found"
    end
  end
end
