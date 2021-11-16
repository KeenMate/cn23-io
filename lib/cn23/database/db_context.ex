# This code has been auto-generated
# Changes to this file will be lost on next generation

defmodule Cn23.Database.DbContext do
  @moduledoc """
  This module contains functions for calling DB's stored procedures.
  Functions of this module uses `query/2` function of Repo that you have provided (`db_config` key of configuration)
  """

  require Logger

  import Elixir.Cn23.Repo, only: [query: 2]

  @spec create_nav(binary(), integer(), binary(), binary(), binary()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.CreateNavItem.t()]}
  def create_nav(created_by, user_id, code, title, nav_state_code) do
    Logger.debug("Calling stored procedure", procedure: "create_nav")

    query(
      "select * from public.create_nav($1, $2, $3, $4, $5)",
      [created_by, user_id, code, title, nav_state_code]
    )
    |> Cn23.Database.Parsers.CreateNavParser.parse_create_nav_result()
  end

  @spec create_nav_item(
          binary(),
          integer(),
          integer(),
          integer(),
          binary(),
          integer(),
          binary(),
          binary(),
          binary(),
          integer()
        ) :: {:error, any()} | {:ok, [Cn23.Database.Models.CreateNavItemItem.t()]}
  def create_nav_item(
        created_by,
        user_id,
        nav_id,
        language_id,
        title,
        parent_item_id,
        url,
        nav_type,
        nav_state,
        priority
      ) do
    Logger.debug("Calling stored procedure", procedure: "create_nav_item")

    query(
      "select * from public.create_nav_item($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)",
      [
        created_by,
        user_id,
        nav_id,
        language_id,
        title,
        parent_item_id,
        url,
        nav_type,
        nav_state,
        priority
      ]
    )
    |> Cn23.Database.Parsers.CreateNavItemParser.parse_create_nav_item_result()
  end

  @spec create_permission_by_code(binary(), integer(), binary(), binary(), binary(), boolean()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.CreatePermissionByCodeItem.t()]}
  def create_permission_by_code(
        created_by,
        user_id,
        data_node_path,
        title,
        parent_code,
        is_assignable
      ) do
    Logger.debug("Calling stored procedure", procedure: "create_permission_by_code")

    query(
      "select * from public.create_permission_by_code($1, $2, $3, $4, $5, $6)",
      [created_by, user_id, data_node_path, title, parent_code, is_assignable]
    )
    |> Cn23.Database.Parsers.CreatePermissionByCodeParser.parse_create_permission_by_code_result()
  end

  @spec create_permission_by_path(binary(), integer(), binary(), binary(), binary(), boolean()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.CreatePermissionByPathItem.t()]}
  def create_permission_by_path(
        created_by,
        user_id,
        data_node_path,
        title,
        parent_path,
        is_assignable
      ) do
    Logger.debug("Calling stored procedure", procedure: "create_permission_by_path")

    query(
      "select * from public.create_permission_by_path($1, $2, $3, $4, $5, $6)",
      [created_by, user_id, data_node_path, title, parent_path, is_assignable]
    )
    |> Cn23.Database.Parsers.CreatePermissionByPathParser.parse_create_permission_by_path_result()
  end

  @spec create_tenant(binary(), binary()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.CreateTenantItem.t()]}
  def create_tenant(email, group_title) do
    Logger.debug("Calling stored procedure", procedure: "create_tenant")

    query(
      "select * from public.create_tenant($1, $2)",
      [email, group_title]
    )
    |> Cn23.Database.Parsers.CreateTenantParser.parse_create_tenant_result()
  end

  @spec delete_nav(binary(), integer(), integer()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.DeleteNavItem.t()]}
  def delete_nav(deleted_by, user_id, nav_id) do
    Logger.debug("Calling stored procedure", procedure: "delete_nav")

    query(
      "select * from public.delete_nav($1, $2, $3)",
      [deleted_by, user_id, nav_id]
    )
    |> Cn23.Database.Parsers.DeleteNavParser.parse_delete_nav_result()
  end

  @spec delete_nav_item(binary(), integer(), binary()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.DeleteNavItemItem.t()]}
  def delete_nav_item(deleted_by, user_id, nav_item_path) do
    Logger.debug("Calling stored procedure", procedure: "delete_nav_item")

    query(
      "select * from public.delete_nav_item($1, $2, $3)",
      [deleted_by, user_id, nav_item_path]
    )
    |> Cn23.Database.Parsers.DeleteNavItemParser.parse_delete_nav_item_result()
  end

  @spec delete_nav_items(binary(), integer(), any()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.DeleteNavItemsItem.t()]}
  def delete_nav_items(deleted_by, user_id, nav_item_ids) do
    Logger.debug("Calling stored procedure", procedure: "delete_nav_items")

    query(
      "select * from public.delete_nav_items($1, $2, $3)",
      [deleted_by, user_id, nav_item_ids]
    )
    |> Cn23.Database.Parsers.DeleteNavItemsParser.parse_delete_nav_items_result()
  end

  @spec get_languages() :: {:error, any()} | {:ok, [Cn23.Database.Models.GetLanguagesItem.t()]}
  def get_languages() do
    Logger.debug("Calling stored procedure", procedure: "get_languages")

    query(
      "select * from public.get_languages()",
      []
    )
    |> Cn23.Database.Parsers.GetLanguagesParser.parse_get_languages_result()
  end

  @spec get_navigation(binary(), integer()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.GetNavigationItem.t()]}
  def get_navigation(code, language_id) do
    Logger.debug("Calling stored procedure", procedure: "get_navigation")

    query(
      "select * from public.get_navigation($1, $2)",
      [code, language_id]
    )
    |> Cn23.Database.Parsers.GetNavigationParser.parse_get_navigation_result()
  end

  @spec has_permission(integer(), binary(), integer(), boolean()) ::
          {:error, any()} | {:ok, [boolean()]}
  def has_permission(user_id, perm_code, tenant_id, throw_err) do
    Logger.debug("Calling stored procedure", procedure: "has_permission")

    query(
      "select * from public.has_permission($1, $2, $3, $4)",
      [user_id, perm_code, tenant_id, throw_err]
    )
    |> Cn23.Database.Parsers.HasPermissionParser.parse_has_permission_result()
  end

  @spec import_hs_tariff() ::
          {:error, any()} | {:ok, [Cn23.Database.Models.ImportHsTariffItem.t()]}
  def import_hs_tariff() do
    Logger.debug("Calling stored procedure", procedure: "import_hs_tariff")

    query(
      "select * from public.import_hs_tariff()",
      []
    )
    |> Cn23.Database.Parsers.ImportHsTariffParser.parse_import_hs_tariff_result()
  end

  @spec load_initial_data() :: {:error, any()} | {:ok, [integer()]}
  def load_initial_data() do
    Logger.debug("Calling stored procedure", procedure: "load_initial_data")

    query(
      "select * from public.load_initial_data()",
      []
    )
    |> Cn23.Database.Parsers.LoadInitialDataParser.parse_load_initial_data_result()
  end

  @spec set_nav_visibility(binary(), integer(), integer(), binary()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.SetNavVisibilityItem.t()]}
  def set_nav_visibility(modified_by, user_id, nav_id, nav_state_code) do
    Logger.debug("Calling stored procedure", procedure: "set_nav_visibility")

    query(
      "select * from public.set_nav_visibility($1, $2, $3, $4)",
      [modified_by, user_id, nav_id, nav_state_code]
    )
    |> Cn23.Database.Parsers.SetNavVisibilityParser.parse_set_nav_visibility_result()
  end

  @spec throw_no_permission(integer(), binary(), integer()) :: {:error, any()} | {:ok, [any()]}
  def throw_no_permission(user_id, perm_code, tenant_id) do
    Logger.debug("Calling stored procedure", procedure: "throw_no_permission")

    query(
      "select * from public.throw_no_permission($1, $2, $3)",
      [user_id, perm_code, tenant_id]
    )
    |> Cn23.Database.Parsers.ThrowNoPermissionParser.parse_throw_no_permission_result()
  end

  @spec trg_generate_code_from_title() :: {:error, any()} | {:ok, [any()]}
  def trg_generate_code_from_title() do
    Logger.debug("Calling stored procedure", procedure: "trg_generate_code_from_title")

    query(
      "select * from public.trg_generate_code_from_title()",
      []
    )
    |> Cn23.Database.Parsers.TrgGenerateCodeFromTitleParser.parse_trg_generate_code_from_title_result()
  end

  @spec update_nav(binary(), integer(), integer(), binary(), binary(), binary()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.UpdateNavItem.t()]}
  def update_nav(modified_by, user_id, nav_id, code, title, nav_state_code) do
    Logger.debug("Calling stored procedure", procedure: "update_nav")

    query(
      "select * from public.update_nav($1, $2, $3, $4, $5, $6)",
      [modified_by, user_id, nav_id, code, title, nav_state_code]
    )
    |> Cn23.Database.Parsers.UpdateNavParser.parse_update_nav_result()
  end

  @spec update_nav_item(
          binary(),
          integer(),
          integer(),
          integer(),
          binary(),
          binary(),
          binary(),
          binary()
        ) :: {:error, any()} | {:ok, [Cn23.Database.Models.UpdateNavItemItem.t()]}
  def update_nav_item(
        modified_by,
        user_id,
        nav_item_id,
        language_id,
        nav_type,
        nav_state,
        title,
        url
      ) do
    Logger.debug("Calling stored procedure", procedure: "update_nav_item")

    query(
      "select * from public.update_nav_item($1, $2, $3, $4, $5, $6, $7, $8)",
      [modified_by, user_id, nav_item_id, language_id, nav_type, nav_state, title, url]
    )
    |> Cn23.Database.Parsers.UpdateNavItemParser.parse_update_nav_item_result()
  end

  @spec update_permission_full_code(any()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.UpdatePermissionFullCodeItem.t()]}
  def update_permission_full_code(perm_path) do
    Logger.debug("Calling stored procedure", procedure: "update_permission_full_code")

    query(
      "select * from public.update_permission_full_code($1)",
      [perm_path]
    )
    |> Cn23.Database.Parsers.UpdatePermissionFullCodeParser.parse_update_permission_full_code_result()
  end

  @spec update_permission_full_title(any()) ::
          {:error, any()} | {:ok, [Cn23.Database.Models.UpdatePermissionFullTitleItem.t()]}
  def update_permission_full_title(perm_path) do
    Logger.debug("Calling stored procedure", procedure: "update_permission_full_title")

    query(
      "select * from public.update_permission_full_title($1)",
      [perm_path]
    )
    |> Cn23.Database.Parsers.UpdatePermissionFullTitleParser.parse_update_permission_full_title_result()
  end
end