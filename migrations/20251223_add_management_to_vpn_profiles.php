<?php
require_once __DIR__ . '/../db_config.php';

try {
    $pdo->exec("
        ALTER TABLE `vpn_profiles`
        ADD `management_ip` VARCHAR(255) NULL,
        ADD `management_port` INT NULL;
    ");
    echo "Migration successful: added management_ip and management_port to vpn_profiles table.\n";
} catch (PDOException $e) {
    echo "Error applying migration: " . $e->getMessage() . "\n";
}
