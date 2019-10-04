FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["anc-web-api/anc-web-api.csproj", "anc-web-api/"]
RUN dotnet restore "anc-web-api/anc-web-api.csproj"
COPY . .
WORKDIR "/src/anc-web-api"
RUN dotnet build "anc-web-api.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "anc-web-api.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "anc-web-api.dll"]