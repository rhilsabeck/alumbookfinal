# Created by Victor, edited by Maxwell Barvian
class Degree < ActiveRecord::Base
  self.inheritance_column = nil # Allows the type column to be used without interfering with Rails' conventions

  def self.humanize_type(type)
    humanized_types = {
      aa: 'Associate of Arts (A.A)',
      as: 'Associate of Science (A.S.)',
      ba: 'Bachelor of Arts (B.A.)',
      bs: 'Bachelor of Science (B.S)',
      ma: 'Master of Arts (M.A.)',
      ms: 'Master of Science (M.S.)',
      phd: 'Doctoral (Ph.D.)',
      md: 'Medical Doctor (M.D.)',
      mph: 'Master of Public Health (M.P.H)',
      mpa: 'Master of Public Adminstration (M.P.A)',
      jd: 'Juris Doctor (J.D)',
      mfa: 'Master of Fine Arts (M.F.A)',
      mms: 'Master of Music (M.M.S)',
      me: 'Master of Engineering (M.E.)',
      mlis: 'Master of Library Science (M.L.I.S)',
      msw: 'Master of Social Work (M.S.W)',
      med: 'Master of Education (M.Ed)',
      mba: 'Master of Business Administration (M.B.A)',
    }
    humanized_types[type]
  end

  def self.undergraduate_types
    [ :aa, :as, :ba, :bs ]
  end

  def self.graduate_types
    [ :jd, :ma, :mba, :md, :me, :med, :mfa, :mlis, :mms, :mpa, :mph, :ms, :msw, :phd ]
  end

  enum type: Degree.undergraduate_types + Degree.graduate_types

  def humanized_type
    Degree.humanized_type(type.to_sym)
  end
end
