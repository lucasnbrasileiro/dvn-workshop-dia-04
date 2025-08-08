# Dockerfile self-contained - inclui o runtime .NET no binário
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS builder
WORKDIR /app

# Copiar projeto e restaurar
COPY *.csproj ./
RUN dotnet restore

# Copiar código e buildar self-contained
COPY . .
RUN dotnet publish -c Release -o build \
    --self-contained true \
    --runtime linux-x64 \
    /p:PublishSingleFile=true \
    YoutubeLiveApp.csproj

# Runtime stage - usar runtime-deps em vez de aspnet
FROM mcr.microsoft.com/dotnet/runtime-deps:7.0
WORKDIR /app

# Copiar binário self-contained
COPY --from=builder /app/build ./

# Configurações
ENV ASPNETCORE_URLS=http://0.0.0.0:80
ENV ASPNETCORE_ENVIRONMENT=Production

# Dar permissão de execução
RUN chmod +x YoutubeLiveApp

EXPOSE 80

# Executar binário diretamente (não via dotnet)
ENTRYPOINT ["/app/YoutubeLiveApp"]
