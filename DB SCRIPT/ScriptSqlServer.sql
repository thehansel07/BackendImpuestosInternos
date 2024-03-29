USE [ImpuestoInternos]
GO
/****** Object:  Table [dbo].[ComprobantesFiscales]    Script Date: 3/19/2024 2:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprobantesFiscales](
	[idComprobanteFiscal] [int] IDENTITY(1,1) NOT NULL,
	[rncCedula] [varchar](11) NOT NULL,
	[NCF] [varchar](13) NOT NULL,
	[monto] [decimal](18, 0) NULL,
	[itbis18] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[idComprobanteFiscal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contribuyente]    Script Date: 3/19/2024 2:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contribuyente](
	[rncCedula] [varchar](11) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[tipo] [varchar](30) NULL,
	[estatus] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rncCedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoContribuyente]    Script Date: 3/19/2024 2:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoContribuyente](
	[idTipoContribuyente] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionContribuyente] [varchar](30) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchDog_Logs]    Script Date: 3/19/2024 2:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchDog_Logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eventId] [varchar](100) NULL,
	[message] [varchar](max) NULL,
	[timestamp] [varchar](100) NOT NULL,
	[callingFrom] [varchar](100) NULL,
	[callingMethod] [varchar](100) NULL,
	[lineNumber] [int] NULL,
	[logLevel] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchDog_WatchExceptionLog]    Script Date: 3/19/2024 2:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchDog_WatchExceptionLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message] [varchar](max) NULL,
	[stackTrace] [varchar](max) NULL,
	[typeOf] [varchar](max) NULL,
	[source] [varchar](max) NULL,
	[path] [varchar](max) NULL,
	[method] [varchar](30) NULL,
	[queryString] [varchar](max) NULL,
	[requestBody] [varchar](max) NULL,
	[encounteredAt] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatchDog_WatchLog]    Script Date: 3/19/2024 2:52:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatchDog_WatchLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[responseBody] [varchar](max) NULL,
	[responseStatus] [int] NOT NULL,
	[requestBody] [varchar](max) NULL,
	[queryString] [varchar](max) NULL,
	[path] [varchar](max) NULL,
	[requestHeaders] [varchar](max) NULL,
	[responseHeaders] [varchar](max) NULL,
	[method] [varchar](30) NULL,
	[host] [varchar](max) NULL,
	[ipAddress] [varchar](30) NULL,
	[timeSpent] [varchar](100) NULL,
	[startTime] [varchar](100) NOT NULL,
	[endTime] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[ComprobantesFiscales]  WITH CHECK ADD FOREIGN KEY([rncCedula])
REFERENCES [dbo].[Contribuyente] ([rncCedula])
GO
