import Fluent
import Vapor

struct WebController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get(use: index)
        routes.get("todos", use: todosList)
        routes.get("test", use: test)
    }

    func test(req: Request) async throws -> String {
        return "Test route working!"
    }

    func index(req: Request) async throws -> Response {
        let html = """
        <!DOCTYPE html>
        <html>
        <head>
            <title>Vapor App</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>
        <body>
            <div class="container mt-4">
                <h1>Welcome to Vapor!</h1>
                <p>Your app is running successfully.</p>
                <a href="/todos" class="btn btn-primary">View Todos</a>
            </div>
        </body>
        </html>
        """
        
        var headers = HTTPHeaders()
        headers.add(name: .contentType, value: "text/html")
        return Response(status: .ok, headers: headers, body: .init(string: html))
    }
    
    func todosList(req: Request) async throws -> Response {
        // Check if we have any todos, if not, seed with dummy data
        let existingTodos = try await Todo.query(on: req.db).count()
        
        if existingTodos == 0 {
            try await seedDummyTodos(on: req.db)
        }
        
        let todos = try await Todo.query(on: req.db).all()
        
        let todoListHTML = todos.map { todo in
            "<li class=\"list-group-item\">\(todo.title) <small class=\"text-muted\">(ID: \(todo.id?.uuidString ?? "N/A"))</small></li>"
        }.joined()
        
        let html = """
        <!DOCTYPE html>
        <html>
        <head>
            <title>Todo List</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        </head>
        <body>
            <div class="container mt-4">
                <h1>Todo List</h1>
                <p>Total todos: \(todos.count)</p>
                <ul class="list-group">
                    \(todoListHTML)
                </ul>
                <div class="mt-3">
                    <a href="/" class="btn btn-secondary">← Back</a>
                </div>
            </div>
        </body>
        </html>
        """
        
        var headers = HTTPHeaders()
        headers.add(name: .contentType, value: "text/html")
        return Response(status: .ok, headers: headers, body: .init(string: html))
    }
    
    private func seedDummyTodos(on database: Database) async throws {
        let dummyTodos = [
            Todo(title: "Learn Swift Vapor framework"),
            Todo(title: "Build a REST API"),
            Todo(title: "Set up database migrations"),
            Todo(title: "Create beautiful web templates"),
            Todo(title: "Write comprehensive tests"),
            Todo(title: "Deploy to production"),
            Todo(title: "Add user authentication"),
            Todo(title: "Implement caching strategy"),
            Todo(title: "Optimize database queries"),
            Todo(title: "Create admin dashboard")
        ]
        
        for todo in dummyTodos {
            try await todo.save(on: database)
        }
    }
}