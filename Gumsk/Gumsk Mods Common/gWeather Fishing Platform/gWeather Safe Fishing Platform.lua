Author = "Gumsk"
ModName = "gWeather"
ModNameSub = "Safe Fishing Platform"
BaseDescription = "Basic floor pieces have hazard protection"
GameVersion = "5.1.1.0"
ModVersion = "a"

HeaterAdd = [[    <Property value="TkSceneNodeData.xml">
          <Property name="Name" value="Heater" />
          <Property name="NameHash" value="]]..GNH("Heater")..[[" />
          <Property name="Type" value="LOCATOR" />
          <Property name="Transform" value="TkTransformData.xml">
            <Property name="TransX" value="0" />
            <Property name="TransY" value="0" />
            <Property name="TransZ" value="0" />
            <Property name="RotX" value="0" />
            <Property name="RotY" value="0" />
            <Property name="RotZ" value="0" />
            <Property name="ScaleX" value="1" />
            <Property name="ScaleY" value="1" />
            <Property name="ScaleZ" value="1" />
          </Property>
          <Property name="Attributes">
            <Property value="TkSceneNodeAttributeData.xml">
              <Property name="Name" value="ATTACHMENT" />
              <Property name="Value" value="GUMSK/GUMSKHEATER.ENTITY.MBIN" />
            </Property>
          </Property>
          <Property name="Children">
            <Property value="TkSceneNodeData.xml">
              <Property name="Name" value="HeaterCollision" />
              <Property name="NameHash" value="]]..GNH("HeaterCollision")..[[" />
              <Property name="Type" value="COLLISION" />
              <Property name="Transform" value="TkTransformData.xml">
                <Property name="TransX" value="0" />
                <Property name="TransY" value="0" />
                <Property name="TransZ" value="0" />
                <Property name="RotX" value="0" />
                <Property name="RotY" value="0" />
                <Property name="RotZ" value="0" />
                <Property name="ScaleX" value="1" />
                <Property name="ScaleY" value="1" />
                <Property name="ScaleZ" value="1" />
              </Property>
              <Property name="Attributes">
                <Property value="TkSceneNodeAttributeData.xml">
                  <Property name="Name" value="TYPE" />
                  <Property name="Value" value="Sphere" />
                </Property>
                <Property value="TkSceneNodeAttributeData.xml">
                  <Property name="Name" value="RADIUS" />
                  <Property name="Value" value="5" />
                </Property>
              </Property>
              <Property name="Children" />
            </Property>
          </Property>
        </Property>]]

NMS_MOD_DEFINITION_CONTAINER = {
  MOD_FILENAME  = ModName.." "..ModNameSub.." "..GameVersion..ModVersion..".pak",
  MOD_DESCRIPTION  = BaseDescription,
  MOD_AUTHOR    = Author,
  NMS_VERSION    = GameVersion,
  ADD_FILES     = {
    {
      FILE_DESTINATION     = [[GUMSK/GUMSKHEATER.ENTITY.EXML]],
      FILE_CONTENT   = [[<?xml version="1.0" encoding="utf-8"?>
<Data template="TkAttachmentData">
  <Property name="Components">
    <Property value="LinkableNMSTemplate.xml">
      <Property name="Template" value="TkPhysicsComponentData.xml">
        <Property name="Data" value="TkPhysicsData.xml">
          <Property name="Mass" value="0" />
          <Property name="Friction" value="0.5" />
          <Property name="RollingFriction" value="0.2" />
          <Property name="AngularDamping" value="0.2" />
          <Property name="LinearDamping" value="0.1" />
          <Property name="Gravity" value="20" />
        </Property>
        <Property name="TriggerVolumeType" value="TkVolumeTriggerType.xml">
          <Property name="VolumeTriggerType" value="GenericInterior" />
        </Property>
        <Property name="SurfaceProperties" value="None" />
        <Property name="TriggerVolume" value="True" />
        <Property name="Climbable" value="False" />
        <Property name="Floor" value="False" />
        <Property name="IgnoreModelOwner" value="False" />
        <Property name="NoVehicleCollide" value="False" />
        <Property name="NoPlayerCollide" value="False" />
        <Property name="CameraInvisible" value="False" />
        <Property name="InvisibleForInteraction" value="False" />
        <Property name="AllowTeleporter" value="True" />
        <Property name="BlockTeleporter" value="False" />
        <Property name="DisableGravity" value="False" />
        <Property name="SpinOnCreate" value="0" />
      <Property name="UseBasePartOptimisation" value="False" />
      <Property name="IsTransporter" value="False" />
      </Property>
      <Property name="Linked" value="" />
    </Property>
  </Property>
  <Property name="LodDistances">
    <Property value="0" />
    <Property value="50" />
    <Property value="80" />
    <Property value="150" />
    <Property value="500" />
  </Property>
</Data>]],
    }
  },
  MODIFICATIONS  = {
    {
      MBIN_CHANGE_TABLE = {
        {
          MBIN_FILE_SOURCE = {
            "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\BUILDABLEPARTS\TECH\FISHINGPLATFORM.SCENE.MBIN",
          },
          EXML_CHANGE_TABLE = {
            {
              SPECIAL_KEY_WORDS = {"Name","SpinData"},
              REPLACE_TYPE = "ADDAFTERSECTION",
              ADD = HeaterAdd,
            },
          },
        },
      }
    }
  }
}