#!/bin/bash

# Hardcoded project IDs
DEV_PROJECT="mlfsi-jupiter-apollo"
QA_PROJECT="mlfsi-polaris-celestino"
PREPROD_PROJECT="mlfsi-altair-phoenix"
PROD_PROJECT="mlfsi-astrid-taurus"

# Get Apollo project number
echo "Fetching Apollo project number..."
DEV_PROJECT_NUMBER=$(gcloud projects describe "$DEV_PROJECT" --format="value(projectNumber)")

if [ -z "$DEV_PROJECT_NUMBER" ]; then
  echo "❌ Failed to get project number for $DEV_PROJECT. Exiting."
  exit 1
fi

echo "✅ Apollo project number is $DEV_PROJECT_NUMBER"
echo ""

# Function to apply target config
apply_target() {
  local TARGET_NAME=$1
  local TARGET_PROJECT=$2
  local TARGET_CONFIG_PATH=$3

  echo "👉 Setting up target '$TARGET_NAME' in project '$TARGET_PROJECT'..."

  gcloud config set project "$TARGET_PROJECT"

  echo "📁 Creating Cloud Deploy target '$TARGET_NAME'..."
  gcloud deploy targets create "$TARGET_NAME" \
    --region=asia-southeast1 \
    --target-config="$TARGET_CONFIG_PATH"

  echo "✅ Target '$TARGET_NAME' created in '$TARGET_PROJECT'."
  echo ""
}

# Call function for each environment
apply_target "dev" "$DEV_PROJECT" "targets/dev-target.yaml"
apply_target "qa" "$QA_PROJECT" "targets/qa-target.yaml"
apply_target "preprod" "$PREPROD_PROJECT" "targets/preprod-target.yaml"
apply_target "prod" "$PROD_PROJECT" "targets/prod-target.yaml"

echo "🎉 All targets created (IAM roles not modified — please grant them manually if needed)."
