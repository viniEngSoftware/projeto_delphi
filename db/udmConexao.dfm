object dmConexao: TdmConexao
  Height = 551
  Width = 950
  PixelsPerInch = 144
  object fdConexao: TFDConnection
    Params.Strings = (
      'DriverID=PG'
      'Database=sistemadevendas'
      'User_Name=postgres'
      'Password=postgres'
      'Server=localhost'
      'Port=5432'
      
        'LibraryLocation=C:\Users\vinicius\Desktop\projeto_delphi\libpq.d' +
        'll')
    Connected = True
    LoginPrompt = False
    Left = 456
    Top = 168
  end
end
