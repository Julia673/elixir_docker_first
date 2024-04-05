# Use the official Elixir image
FROM elixir:latest

# Set environment variables
ENV MIX_ENV=prod \
    PORT=4000

# Install Hex and Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

# Set the working directory
WORKDIR /app

# Copy mix.exs and mix.lock files
COPY mix.* ./

# Install dependencies
RUN mix deps.get

# Copy the remaining application files
COPY . .

# Compile the project
RUN mix compile

# Install Phoenix Framework
RUN mix archive.install hex phx_new --force

# Create a new Phoenix application
RUN mix phx.new elixir_docker_first --no-ecto

# Change directory to the new Phoenix application
WORKDIR /app/elixir_docker_first

# Expose port
EXPOSE $PORT

# Run the application
CMD ["mix", "phx.server"]