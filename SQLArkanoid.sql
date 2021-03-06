USE [Arkanoid]
GO
/****** Object:  Table [dbo].[Estadisticas]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estadisticas](
	[Usuario] [varchar](20) NOT NULL,
	[PartidasJugadas] [nchar](10) NOT NULL,
	[NivelesCompletados] [nchar](10) NOT NULL,
	[NivelesPerdidos] [nchar](10) NOT NULL,
	[Victorias] [nchar](10) NOT NULL,
	[Derrotas] [nchar](10) NOT NULL,
	[PuntuacionMasAlta] [nchar](20) NOT NULL,
	[TiempoJugado] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Estadisticas] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroDeLogeos]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroDeLogeos](
	[NroRegistro] [nchar](10) NOT NULL,
	[Usuario] [varchar](20) NOT NULL,
	[InicioDeSesion] [varchar](50) NOT NULL,
	[CierreDeSesion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RegistroDeLogeos] PRIMARY KEY CLUSTERED 
(
	[NroRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroDeUsuarios]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroDeUsuarios](
	[Usuario] [varchar](20) NOT NULL,
	[Contraseña] [varchar](20) NOT NULL,
	[NivelActual] [nchar](10) NOT NULL,
	[PuntuacionActual] [nchar](20) NOT NULL,
 CONSTRAINT [PK_RegistroDeUsuarios] PRIMARY KEY CLUSTERED 
(
	[Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Estadisticas]  WITH CHECK ADD  CONSTRAINT [FK_Estadisticas_RegistroDeUsuarios] FOREIGN KEY([Usuario])
REFERENCES [dbo].[RegistroDeUsuarios] ([Usuario])
GO
ALTER TABLE [dbo].[Estadisticas] CHECK CONSTRAINT [FK_Estadisticas_RegistroDeUsuarios]
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadisticas]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ActualizarEstadisticas]
@usuario varchar(20), @partidasjugadas nchar(10), @nivelescompletos nchar(10), @nivelesperdidos nchar(10), @victorias nchar(10), @derrotas nchar(10), @puntuacionmasalta  nchar(20), @tiempojugado varchar(30)
as
begin

Update Estadisticas set 
PartidasJugadas = @partidasjugadas ,
NivelesCompletados = @nivelescompletos ,
NivelesPerdidos = @nivelesperdidos,
Victorias = @victorias,
Derrotas = @derrotas,
PuntuacionMasAlta = @puntuacionmasalta,
TiempoJugado = @tiempojugado
Where Usuario = @usuario
end
GO
/****** Object:  StoredProcedure [dbo].[ActualizarRegistroDeLogeos]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ActualizarRegistroDeLogeos]
@id nchar(10), @usuario varchar(20), @iniciodesesion varchar(50), @cierredesesion varchar(50)
as
begin

Update RegistroDeLogeos set 
InicioDeSesion = @iniciodesesion ,
CierreDeSesion = @cierredesesion
Where Usuario = @usuario AND NroRegistro = @id
end
GO
/****** Object:  StoredProcedure [dbo].[ActualizarUsuario]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ActualizarUsuario]
@usuario varchar(20), @nivelactual nchar(10), @puntuacionactual nchar(20)
as
begin

Update RegistroDeUsuarios set 
NivelActual = @nivelactual ,
PuntuacionActual = @puntuacionactual
Where Usuario = @usuario
end
GO
/****** Object:  StoredProcedure [dbo].[BuscarEstadisticas]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[BuscarEstadisticas]
as
begin

SELECT a.Usuario, a.PartidasJugadas, a.NivelesCompletados, a.NivelesPerdidos, a.Victorias, a.Derrotas, a.PuntuacionMasAlta, a.TiempoJugado
FROM  Estadisticas a

end
GO
/****** Object:  StoredProcedure [dbo].[BuscarIDRegistroDeLogeos]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BuscarIDRegistroDeLogeos]
as
begin

SELECT a.NroRegistro
FROM RegistroDeLogeos a

end
GO
/****** Object:  StoredProcedure [dbo].[BuscarRegistroDeLog]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BuscarRegistroDeLog]
@usuario varchar(20)
as
begin

SELECT a.InicioDeSesion, a.CierreDeSesion
FROM RegistroDeLogeos a where Usuario = @usuario
end
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsuario]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BuscarUsuario]
as
begin

SELECT a.Usuario , a.Contraseña, a.NivelActual, a.PuntuacionActual
FROM RegistroDeUsuarios a

end
GO
/****** Object:  StoredProcedure [dbo].[CrearEstadisticas]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CrearEstadisticas]
@usuario varchar(20), @partidasjugadas nchar(10), @nivelescompletos nchar(10), @nivelesperdidos nchar(10), @victorias nchar(10), @derrotas nchar(10), @puntuacionmasalta  nchar(20), @tiempojugado varchar(30)
as
begin


Insert Into Estadisticas(Usuario,PartidasJugadas,NivelesCompletados,NivelesPerdidos,Victorias,Derrotas,PuntuacionMasAlta,TiempoJugado) Values (@usuario,@partidasjugadas,@nivelescompletos,@nivelesperdidos,@victorias,@derrotas,@puntuacionmasalta,@tiempojugado)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertarRegistroDeLogeos]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertarRegistroDeLogeos]
@id nchar(10), @usuario varchar(20), @iniciodesesion varchar(50), @cierredesesion varchar(50)
as
begin


Insert Into RegistroDeLogeos(NroRegistro,Usuario,InicioDeSesion,CierreDeSesion) Values (@id,@usuario,@iniciodesesion,@cierredesesion)
end
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 16/11/2020 10:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RegistrarUsuario]
@usuario varchar(20), @contra varchar(20), @nivel nchar(10), @puntuacion nchar(20)
as
begin

Insert Into RegistroDeUsuarios (Usuario,Contraseña,NivelActual,PuntuacionActual) values (@usuario,@contra,@nivel,@puntuacion)
end
GO
