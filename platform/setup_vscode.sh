cat > setup_vscode.sh << 'EOF'
#!/bin/bash
mkdir -p .vscode
cat > .vscode/tasks.json << 'TASKEOF'
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "npm: watch",
      "type": "shell",
      "command": "npm run watch",
      "isBackground": true,
      "problemMatcher": ["$tsc-watch"],
      "group": "build"
    },
    {
      "label": "npm: build",
      "type": "shell",
      "command": "npm run build",
      "group": "build",
      "problemMatcher": ["$tsc"]
    }
  ]
}
TASKEOF
cat > .vscode/launch.json << 'LAUNCHED'
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "aws-sam",
      "request": "direct-invoke",
      "name": "Invoke Lambda",
      "invokeTarget": {
        "target": "code",
        "lambdaHandler": "app.lambdaHandler",
        "projectRoot": "${workspaceFolder}"
      },
      "lambda": {
        "runtime": "nodejs18.x",
        "payload": { "json": {} }
      }
    },
    {
      "type": "node",
      "request": "launch",
      "name": "Launch Program",
      "program": "${file}",
      "skipFiles": ["<node_internals>/**"],
      "env": {
        "NODE_ENV": "development",
        "API_KEY": "${env:API_KEY}"
      }
    },
    {
      "type": "node",
      "request": "attach",
      "name": "Docker: Attach to Node",
      "remoteRoot": "/usr/src/app",
      "port": 9229,
      "localRoot": "${workspaceFolder}"
    },
    {
      "type": "python",
      "request": "launch",
      "name": "Python: Launch File",
      "program": "${file}",
      "console": "integratedTerminal",
      "env": {
        "PYTHONPATH": "${workspaceFolder}/src"
      }
    },
    {
      "name": "Python: Remote Attach",
      "type": "python",
      "request": "attach",
      "connect": {
        "host": "remote.server.com",
        "port": 5678
      },
      "pathMappings": [
        {
          "localRoot": "${workspaceFolder}",
          "remoteRoot": "/app"
        }
      ]
    },
    {
      "type": "node-terminal",
      "request": "launch",
      "name": "Run npm start",
      "command": "npm start"
    },
    {
      "type": "chrome",
      "request": "launch",
      "name": "Launch Chrome",
      "url": "http://localhost:3000",
      "webRoot": "${workspaceFolder}"
    },
    {
      "type": "msedge",
      "request": "launch",
      "name": "Launch Edge",
      "url": "http://localhost:3000",
      "webRoot": "${workspaceFolder}"
    },
    {
      "type": "dart",
      "request": "attach",
      "name": "Flutter: Attach to Device"
    },
    {
      "type": "dart",
      "request": "launch",
      "name": "Flutter",
      "program": "lib/main.dart",
      "flutterMode": "debug"
    },
    {
      "type": "extensionHost",
      "request": "launch",
      "name": "Launch Extension",
      "args": ["--extensionDevelopmentPath=${workspaceFolder}"],
      "outFiles": ["${workspaceFolder}/out/**/*.js"],
      "preLaunchTask": "npm: watch"
    }
  ]
}
LAUNCHED
echo "✅ VS Code launch.json and tasks.json generated in .vscode/"
chmod +x setup_vscode.sh
./setup_vscode.sh
