import Vapor
import Fluent
import FluentSQLiteDriver
import Leaf

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
    app.databases.use(.sqlite(.file("data/db.sqlite")), as: .sqlite)
    
    app.migrations.add(CreateTodo())
    
    // Run migrations automatically
    try await app.autoMigrate()

    // Configure Leaf templating
    app.views.use(.leaf)
    
    // Ensure the views directory is set correctly
    if app.environment != .testing {
        app.leaf.configuration.rootDirectory = app.directory.resourcesDirectory + "Views/"
    }

    // register routes
    try routes(app)
}