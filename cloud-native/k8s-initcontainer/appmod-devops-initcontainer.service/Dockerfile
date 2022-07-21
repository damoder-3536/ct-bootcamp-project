#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["appmod-devops-initcontainer.service/appmod-devops-initcontainer.service.csproj", "appmod-devops-initcontainer.service/"]
RUN dotnet restore "appmod-devops-initcontainer.service/appmod-devops-initcontainer.service.csproj"
COPY . .
WORKDIR "/src/appmod-devops-initcontainer.service"
RUN dotnet build "appmod-devops-initcontainer.service.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "appmod-devops-initcontainer.service.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "appmod-devops-initcontainer.service.dll"]