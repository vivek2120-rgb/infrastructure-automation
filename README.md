This project enables the automated provisioning and teardown of ECS infrastructure using GitHub Actions workflows. 

Authentication between GitHub Actions and AWS is securely handled through OIDC roles, eliminating the need for long-lived credentials.

The primary objective is to ensure that infrastructure is active only when required and is automatically destroyed once the task is completed.

This approach minimizes unnecessary resource usage and helps optimize cloud costs by ensuring that services are billed only during actual usage.
