

locals {
  # Define the environment name once and reuse it throughout the configuration
  environment = "production"
  
  # AWS region - centralized for easy modification
  aws_region = "us-east-1"
  
  # Common tags that will be applied to all resources
  # This ensures consistency across your infrastructure
  common_tags = {
    Environment = local.environment
    Project     = "Terraform-30-Days"
    ManagedBy   = "Terraform"
    CreatedAt   = "2026-07-15"
  }
}

# ============================================================================
# Example 2: Computed Locals (derived from other locals)
# ============================================================================
# Locals can reference other locals, allowing you to build complex values
# from simpler components. This reduces duplication.

locals {
  # Base configuration
  app_name = "myapp"
  
  # Reference other locals to create new values
  resource_prefix = "${local.app_name}-${local.environment}"
  
  # Computed bucket name - useful for globally unique resources
  # S3 bucket names must be globally unique across all AWS accounts
  s3_bucket_name = "${local.resource_prefix}-bucket"
}

# ============================================================================
# Example 3: Using Locals for Conditional Logic
# ============================================================================
# Locals can include conditionals to create environment-specific configurations
# This is useful for having different settings for dev, staging, and production

locals {
  is_production = local.environment == "production"
  
  # Instance type depends on environment
  # Production gets larger instances, while dev gets smaller ones
  instance_type = local.is_production ? "t3.large" : "t3.micro"
  
  # Enable backup and monitoring only in production
  enable_backup    = local.is_production ? true : false
  enable_monitoring = local.is_production ? true : false
  
  # Different replica counts based on environment
  replica_count = local.is_production ? 3 : 1
}

# ============================================================================
# Example 4: Locals with Loops and Advanced Structures
# ============================================================================
# Locals can contain complex data structures used with for loops
# This is powerful for managing multiple similar resources

locals {
  # Define multiple environments with their specific configurations
  environments = {
    dev = {
      instance_type = "t3.micro"
      desired_count = 1
      backup_enabled = false
    }
    staging = {
      instance_type = "t3.small"
      desired_count = 2
      backup_enabled = true
    }
    prod = {
      instance_type = "t3.large"
      desired_count = 3
      backup_enabled = true
    }
  }
  
  # List of services to deploy - can be iterated with for_each
  services = [
    "api",
    "web",
    "worker",
    "scheduler"
  ]
  
  # Map of service ports - useful for security group rules
  service_ports = {
    api      = 8080
    web      = 80
    worker   = 9090
    scheduler = 9091
  }
}

# ============================================================================
# Example 5: Using Locals with Variables and Data Sources
# ============================================================================
# Locals can combine variables, data sources, and static values
# This creates dynamic configurations based on multiple inputs

locals {
  # Reference a variable (passed from terraform.tfvars or command line)
  # Assume a variable 'vpc_cidr' is defined elsewhere
  # vpc_cidr example: variable "vpc_cidr" { default = "10.0.0.0/16" }
  
  # Calculate subnet CIDR blocks from VPC CIDR
  # This demonstrates arithmetic with locals
  # subnet_cidrs = cidrsubnets("10.0.0.0/16", 3, 3, 3, 3)
  
  # Combine multiple values for resource naming
  database_name = "${local.app_name}-${local.environment}-db"
}

# ============================================================================
# Example 6: Locals for Cost Management and Optimization
# ============================================================================
# Use locals to manage configurations that affect billing
# This centralizes cost-related decisions

locals {
  # Cost optimization: enable auto-scaling for production
  auto_scaling_enabled = local.is_production ? true : false
  
  # Use spot instances in non-production for cost savings
  use_spot_instances = !local.is_production
  
  # Storage retention policies - shorter for non-prod, longer for prod
  logs_retention_days = local.is_production ? 90 : 7
  backup_retention_days = local.is_production ? 365 : 30
  
  # Tags for cost allocation and tracking
  cost_tags = {
    CostCenter  = "engineering"
    Billable    = local.is_production ? "true" : "false"
    CostLevel   = local.is_production ? "high" : "low"
  }
}

